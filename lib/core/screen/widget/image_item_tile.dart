import 'dart:io';
import 'package:bapp/core/constant/route.dart';
import 'package:bapp/core/utils/snapshot_handler.dart';
import 'package:flutter/material.dart';

class ImageItemTile extends StatelessWidget {
  const ImageItemTile({super.key, required this.file});

  final File file;


  Future<bool> handleImagePath() async {
    final exists = await file.exists();
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.previewPath, arguments: file);
      },
      child: FutureBuilderHandler(future: handleImagePath(),
          condition: (data) => data == true,
          builder: (data){
        return Container(
            padding: const EdgeInsets.all(5),
            height: 150,
            width: 150,
            child: Image.file(file, fit: BoxFit.fill,));
      })
    );
  }

}
