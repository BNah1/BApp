import 'dart:io';

import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Center(child: Image.file(file))),
    );
  }
}
