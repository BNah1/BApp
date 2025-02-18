import 'package:bapp/UI/Widget/slider_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/Test.dart';

class FilterSelectedContain extends StatefulWidget {
  const FilterSelectedContain({super.key});

  @override
  State<FilterSelectedContain> createState() => _FilterSelectedContainState();
}
double test = 0;

class _FilterSelectedContainState extends State<FilterSelectedContain> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SliderEdit(title: 'Brightness', test: Test(0)),
          SliderEdit(title: 'Brightness', test: Test(0)),
          SliderEdit(title: 'Brightness', test: Test(0)),
          SliderEdit(title: 'Brightness', test: Test(0)),
        ],
      ),
    );
  }
}
