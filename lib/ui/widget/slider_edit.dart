import 'package:flutter/material.dart';

import '../../model/Test.dart';

class SliderEdit extends StatefulWidget {
  const SliderEdit({super.key, required this.title, required this.test});
  final String title;
  final Test test;
  // truyen vao tham so cua state
  // sau do gan init cho no


  @override
  State<SliderEdit> createState() => _SliderEditState();
}

class _SliderEditState extends State<SliderEdit> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(widget.title),
          Expanded(
            child: Slider(
              value: widget.test.brightness,
              min: -1.0,
              max: 1.0,
              divisions: 20,
              label: widget.test.brightness.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  widget.test.brightness = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
