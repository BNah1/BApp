import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/constant/enum.dart';
import 'package:bapp/core/constant/mock_data.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
              style: AppTextStyle.textTitle,
            ),
            PopupMenuButton<EnumSettings>(
              icon: const Icon(Icons.menu),
                onSelected: (EnumSettings result){
                  switch(result){
                    case EnumSettings.logout:
                      debugPrint('Logout');
                      break;
                    case EnumSettings.settings:
                      debugPrint('setting');
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
              future: getImage(),
              builder: (context, snapshot) {
                return AppHelper.checkSnapshot(
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
