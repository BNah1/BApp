
import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/constant/mock_data.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';


class ImageListRow extends StatefulWidget {
  const ImageListRow({super.key});

  @override
  State<ImageListRow> createState() => _ImageGridviewState();
}

class _ImageGridviewState extends State<ImageListRow> {
  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder<List<String>>(
              future: getImage(),
              builder: (context, snapshot) {
                return AppHelper.checkSnapshot(
                    snapshot,
                        (data) =>
                ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width:  150,
                    child: Image.network(data[index]));
                }));
              }),
        ),
      ],
    );
  }
}
