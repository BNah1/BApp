import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderEdit extends StatefulWidget {
  const SliderEdit({super.key, required this.title});
  final String title;


  @override
  State<SliderEdit> createState() => _SliderEditState();
}
double inputValue = 0;

class _SliderEditState extends State<SliderEdit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title),
        Expanded(
          child: Slider(
            value: inputValue,
            min: -1.0,
            max: 1.0,
            divisions: 20,
            label: inputValue.toStringAsFixed(1),
            onChanged: (value) {
              setState(() {
                inputValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
