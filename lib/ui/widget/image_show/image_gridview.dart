import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constant/data_test.dart';
import '../../../constant/constant.dart';

class ImageGridview extends StatefulWidget {
  const ImageGridview({super.key});

  @override
  State<ImageGridview> createState() => _ImageGridviewState();
}

class _ImageGridviewState extends State<ImageGridview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "For you",
              style: fTextCustom.textTitle,
            ),
            PopupMenuButton<EnumSettings>(
              icon: const Icon(Icons.menu),
                onSelected: (EnumSettings result){
                  switch(result){
                    case EnumSettings.logout:
                      print('Logout');
                      break;
                    case EnumSettings.settings:
                      print('setting');
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<EnumSettings>>[
                const PopupMenuItem(
                  value: EnumSettings.settings,
                  child: Text("Setting"),
                ),
                const PopupMenuItem(
                  value: EnumSettings.logout,
                  child: Text("Logout"),
                )
              ];
            })
          ],
        ),
        Expanded(
          child: FutureBuilder<List<String>>(
              future: getImgage(),
              builder: (context, snapshot) {
                return checkSnapshot(
                    snapshot,
                    (data) => MasonryGridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(data[index]);
                        }));
              }),
        ),
      ],
    );
  }
}
