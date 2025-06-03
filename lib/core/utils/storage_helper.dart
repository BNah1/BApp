import 'dart:io';

import 'package:bapp/core/config/di.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:hive/hive.dart';

class StorageHelper{
  static final _imageBox = getIt<Box<ImageModel>>();

  static Future<List<ImageModel>> getImages() async {
    final images = _imageBox.values.toList();

    final newList = await Future.wait(images.map((e)async{
      final exist = await File(e.path).exists();
      return exist ? e : null;
    }));

    return newList.whereType<ImageModel>().toList();
  }

  StorageHelper._();
}