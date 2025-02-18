import 'package:flutter/material.dart';


class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.text, required this.color, required this.height, required this.tap});
  final String text;
  final Color color;
  final double height;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tap(),
      child: Container(
        width: height * 16/4,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}

