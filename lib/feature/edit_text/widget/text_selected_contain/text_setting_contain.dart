import 'package:flutter/material.dart';


class TextSettingContain extends StatefulWidget {
  const TextSettingContain({super.key});

  @override
  State<TextSettingContain> createState() => _TextSettingContainState();
}

class _TextSettingContainState extends State<TextSettingContain> {
  _EnumSelected selectedEnum = _EnumSelected.set1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fontContain(
                  Icons.format_align_left_rounded, _EnumSelected.set1, () {}),
              _fontContain(
                  Icons.format_align_center_sharp, _EnumSelected.set2, () {}),
              _fontContain(
                  Icons.format_align_right_rounded, _EnumSelected.set3, () {}),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // SliderEdit(title: 'T', test: Test(0),),
          // SliderEdit(title: "|||", test: Test(0)),
        ],
      ),
    );
  }

  Widget _fontContain(
    IconData icon,
    _EnumSelected selected,
    Function tap,
  ) {
    Color color = selected == selectedEnum ? Colors.red : Colors.black;

    return InkWell(
      onTap: () {
        setState(() {
          selectedEnum = selected;
        });
        tap();
      },
      child: Container(
          width: 100,
          height: 15,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: color,
          )),
    );
  }
}

enum _EnumSelected { set1, set2, set3 }
