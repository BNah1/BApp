import 'package:bapp/UI/Widget/slider_edit.dart';
import 'package:bapp/constant/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterSelectedContain extends StatefulWidget {
  const FilterSelectedContain({super.key});

  @override
  State<FilterSelectedContain> createState() => _FilterSelectedContainState();
}

class _FilterSelectedContainState extends State<FilterSelectedContain> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SliderEdit(
              title: 'Brightness',
              editImageEffectEnum: EditImageEffectEnum.brightness),
          SliderEdit(
              title: 'Saturation',
              editImageEffectEnum: EditImageEffectEnum.saturation),
        ],
      ),
    );
  }
}
