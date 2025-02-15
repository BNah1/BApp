import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextColorContain extends StatelessWidget {
  const TextColorContain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          _ColorContain(Colors.grey, (){}),
          _ColorContain(Colors.red, (){}),
          _ColorContain(Colors.blue, (){}),
          _ColorContain(Colors.green, (){}),
          _ColorContain(Colors.lime, (){}),
          _ColorContain(Colors.lightBlue, (){}),
          _ColorContain(Colors.greenAccent, (){}),
          _ColorContain(Colors.redAccent, (){}),
        ],
      ),
    );
  }

  Widget _ColorContain(Color color, Function tap){
    return Expanded(
      child: InkWell(
        onTap: () => tap(),
        child: Container(
          height: 80,
          width: 40,
          color: color,
        ),
      ),
    );
  }
}
