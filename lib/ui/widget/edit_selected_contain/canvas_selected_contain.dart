import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasSelectedContain extends StatefulWidget {
  const CanvasSelectedContain({super.key});

  @override
  State<CanvasSelectedContain> createState() => _CanvasSelectedContainState();
}

class _CanvasSelectedContainState extends State<CanvasSelectedContain> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _BoxWidget(1, 1, EnumSelect.icon),
          _BoxWidget(1, 1, EnumSelect.text),
          _BoxWidget(4, 5, EnumSelect.text),
          _BoxWidget(16, 9, EnumSelect.text),
          _BoxWidget(9, 16, EnumSelect.text),
          _BoxWidget(3, 4, EnumSelect.text),
          _BoxWidget(3, 1, EnumSelect.none),
        ],
      ),
    );
  }
}

enum EnumSelect { icon, text, none }

Widget _BoxWidget(int rateX, int rateY, EnumSelect select) {
  double height = 60.0;
  double width = height * (rateX / rateY);
  if (width > 150.0) {
    width = 50.0;
    height = 19;
  } else if (width > 100) {
    width = 70.0;
    height = 70 * 9 / 16;
  }
  return Container(
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
    ),
    height: height,
    width: width,
    child: Center(child: _EnumWidget(select, rateX, rateY)),
  );
}

Widget _EnumWidget(EnumSelect select, int rateX, int rateY) {
  switch (select) {
    case EnumSelect.text:
      return Text("$rateX:$rateY");
    case EnumSelect.icon:
      return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black),
        ),
      );
    default:
      return const SizedBox.shrink();
  }
}
