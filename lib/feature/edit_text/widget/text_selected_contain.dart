
import 'package:bapp/feature/edit_text/widget/text_selected_contain/text_color_contain.dart';
import 'package:bapp/feature/edit_text/widget/text_selected_contain/text_font_contain.dart';
import 'package:bapp/feature/edit_text/widget/text_selected_contain/text_setting_contain.dart';
import 'package:flutter/material.dart';

class TextSelectedContain extends StatefulWidget {
  const TextSelectedContain({super.key});

  @override
  State<TextSelectedContain> createState() => _TextSelectedContainState();
}

  _EnumSelected _selectedEnum = _EnumSelected.text;


class _TextSelectedContainState extends State<TextSelectedContain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _button(Icons.invert_colors_on_sharp,(){}, _EnumSelected.color),
            _button(Icons.text_fields_rounded,(){}, _EnumSelected.text),
            _button(Icons.menu_open_outlined,(){}, _EnumSelected.setting),
          ],
        ),

        //
        const Spacer(),
        // lay contain sau khi chon enum
        _getContain(_selectedEnum),
        const Spacer(),


      ],
    );
  }

  Widget _getContain(_EnumSelected result){
    switch(result){
      case _EnumSelected.text:
        return const TextFontContain();
      case _EnumSelected.color:
        return const TextColorContain();
      case _EnumSelected.setting:
        return const TextSettingContain();
      }
  }

  Widget _button(IconData icon, Function tap, _EnumSelected selected){
    Color color = selected == _selectedEnum ? Colors.red : Colors.black ;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedEnum = selected;
        });
        tap();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 30,color: color),
      ),
    );
  }
}

enum _EnumSelected{color, text , setting }

