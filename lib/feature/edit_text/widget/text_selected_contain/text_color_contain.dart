import 'package:flutter/material.dart';

class TextColorContain extends StatelessWidget {
  const TextColorContain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          _colorContain(Colors.grey, (){}),
          _colorContain(Colors.red, (){}),
          _colorContain(Colors.blue, (){}),
          _colorContain(Colors.green, (){}),
          _colorContain(Colors.lime, (){}),
          _colorContain(Colors.lightBlue, (){}),
          _colorContain(Colors.greenAccent, (){}),
          _colorContain(Colors.redAccent, (){}),
        ],
      ),
    );
  }

  Widget _colorContain(Color color, Function tap){
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
