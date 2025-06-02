
import 'dart:io';

import 'package:bapp/core/config/di.dart';
import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/constant/mock_data.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final _imageBox = getIt<Box<ImageModel>>();

class ImageListRow extends StatefulWidget {
  const ImageListRow({super.key});

  @override
  State<ImageListRow> createState() => _ImageGridviewState();
}

class _ImageGridviewState extends State<ImageListRow> {

  @override
  Widget build(BuildContext context) {
    final images = _imageBox.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Creation",
              style: AppTextStyle.textTitle,
            ),
            const Text('See all >', style: TextStyle(color: Colors.red),)
          ]
        ),
        SizedBox(
          height: 150,
          child:
            ListView.builder(
                itemCount: images.length,
                itemBuilder: (_, index){
              final image = images[index];
              return SizedBox(
                width: 150,
                height: 150,
                child: Image.file(File(image.path)),
              );
            })

          // FutureBuilder<List<String>>(
          //     future: getImage(),
          //     builder: (context, snapshot) {
          //       return AppHelper.checkSnapshot(
          //           snapshot,
          //               (data) =>
          //       ListView.builder(
          //           itemCount: data.length,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (BuildContext context, int index) {
          //         return SizedBox(
          //           width:  150,
          //           child: Image.network(data[index]));
          //       }));
          //     }),
        ),
      ],
    );
  }
}
