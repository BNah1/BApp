import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
          height: 68,
          width: 68,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ));
  }
}
