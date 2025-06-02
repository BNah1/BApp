import 'dart:io';

import 'package:bapp/core/config/di.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';import 'package:image_picker/image_picker.dart';

import 'package:bapp/feature/edit_image/screen/edit_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_image_editor/core/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/features/main_editor/main_editor.dart';


class AppHelper{
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
        EditScreen.name,
        arguments: pickedFile.path,
      );
    }
  }
}

static Future<void> pickImageEdit(BuildContext context) async {
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

            final ImageModel imageModel = ImageModel(path: pickedFile.path, name: pickedFile.name, createdAt: DateTime.now());


            final result = await ImageGallerySaver.saveImage(
              bytes,
              name: 'Bonah_APP_${imageModel.path}_${imageModel.createdAt}',
              quality: 100,
            );

            await _imageBox.add(imageModel);

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
