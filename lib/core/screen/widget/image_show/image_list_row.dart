import 'dart:io';
import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/screen/widget/image_item_tile.dart';
import 'package:bapp/core/utils/snapshot_handler.dart';
import 'package:bapp/core/utils/storage_helper.dart';
import 'package:bapp/feature/recently_edit_image/state/recently_edit_image_viewmodel.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ImageListRow extends ConsumerWidget {
  const ImageListRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Recent Creation",
            style: AppTextStyle.textTitle,
          ),
          const Text(
            'See all >',
            style: TextStyle(color: Colors.red),
          )
        ]),
        _listImages(ref)
      ],
    );
  }

  Widget _listImages(WidgetRef ref) {
    final state = ref.watch(recentlyEditImageViewModel);
    return AsyncValueHandler(state: state, builder: (images){
      return SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (_, index) {
                final image = images[index];
                return ImageItemTile(file: File(image.path));
              }));
    });

  }
}
