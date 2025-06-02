import 'package:flutter/material.dart';

class TextFontContain extends StatefulWidget {
  const TextFontContain({super.key});

  @override
  State<TextFontContain> createState() => _TextFontContainState();
}

class _TextFontContainState extends State<TextFontContain> {
  _EnumSelected selectedEnum = _EnumSelected.robota;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _fontContain("Robota", FontStyle.italic, _EnumSelected.robota, () {}),
          _fontContain(
              "Trade Win", FontStyle.italic, _EnumSelected.tradewin, () {}),
          _fontContain("Basic", FontStyle.normal, _EnumSelected.basic1, () {}),
          _fontContain("Poppin", FontStyle.italic, _EnumSelected.basic2, () {}),
        ],
      ),
    );
  }

  Widget _fontContain(
    String text,
    FontStyle style,
    _EnumSelected selected,
    Function tap,
  ) {
    Color color = selected == selectedEnum ? Colors.red : Colors.black;
    FontWeight weight =
        selected == selectedEnum ? FontWeight.bold : FontWeight.normal;
    TextStyle styleT = TextStyle(
      color: color,
      fontStyle: style,
      fontWeight: weight
    );
    return InkWell(
      onTap: () {
        setState(() {
          selectedEnum = selected;
        });
        tap();
      },
      child: Container(
        width: 100,
        alignment: Alignment.center,
        child: Text(text, style: styleT),
      ),
    );
  }
}

enum _EnumSelected { robota, tradewin, basic1, basic2 }
