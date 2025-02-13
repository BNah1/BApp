import 'package:bapp/UI/Screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget CheckSnapshot<T>(
    AsyncSnapshot<List<T>> snapshot, Widget Function(List<T>) builder) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return const Center(child: Text('No data found'));
  }
  return builder(snapshot.data!);
}

Future<void> pickImage(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  print(pickedFile?.path);
  if (pickedFile != null) {
    Navigator.pushNamed(
      context,
      EditScreen.name,
      arguments: pickedFile.path,
    );
  }

}
