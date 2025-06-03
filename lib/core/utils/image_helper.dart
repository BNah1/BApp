import 'dart:io';

import 'package:bapp/core/config/di.dart';
import 'package:bapp/core/constant/route.dart';
import 'package:bapp/feature/recently_edit_image/state/recently_edit_image_viewmodel.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_image_editor/core/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/features/main_editor/main_editor.dart';


class ImageHelper{
  static final _imageBox = getIt<Box<ImageModel>>();

  static Widget checkSnapshot<T>(
    AsyncSnapshot<List<T>> snapshot, Widget Function(List<T>) builder) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return const Center(child: Text('No data found'));
  }
  return builder(snapshot.data!);
}

static Future<void> pickImage(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  debugPrint(pickedFile?.path);

  if (pickedFile != null) {
    if(context.mounted){
      Navigator.pushNamed(
        context,
        Routes.editPath,
        arguments: pickedFile.path,
      );
    }
  }
}

static Future<void> pickImageEdit(BuildContext context , WidgetRef ref) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  final String path = pickedFile?.path ?? '';
  debugPrint(pickedFile?.path);

  if (pickedFile != null) {
    if(context.mounted){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProImageEditor.file(File(path), callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: (bytes) async{

            final status = await Permission.photos.request();
            if (status.isDenied || status.isPermanentlyDenied) {
              final storageStatus = await Permission.storage.request();
              if (!storageStatus.isGranted) {
                openAppSettings(); // Gợi ý mở cài đặt
                return;
              }
            }

            final directory = await getApplicationDocumentsDirectory();
            final String savePath = '${directory.path}/Bonah_${DateTime.now().millisecondsSinceEpoch}.jpg';
            final file = await File(savePath).writeAsBytes(bytes);

            final ImageModel imageModel = ImageModel(path: savePath, name: pickedFile.name, createdAt: DateTime.now());

            final result = await ImageGallerySaver.saveImage(
              bytes,
              name: 'Bonah_APP_${imageModel.path}_${imageModel.createdAt}',
              quality: 100,
            );


            final exists = await file.exists();
            debugPrint('File exists: $exists, path: $savePath');

            await ref.read(recentlyEditImageViewModel.notifier).addImage(imageModel);

            debugPrint('Save result: $result');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Save !!!')),
              );
              Navigator.pop(context);
            }
          }
        )))
      );
    }
  }
}

}
