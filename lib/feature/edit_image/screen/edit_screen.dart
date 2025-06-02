import 'dart:io';

import 'package:bapp/core/constant/app_string.dart';
import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/shared/ui/widget/edit_button_row.dart';
import 'package:flutter/material.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key});
  static String name = '/filter';

  @override
  State<EditScreen> createState() => _EditScreen();
}

class _EditScreen extends State<EditScreen> {
  late File imageFile;

@override
  void didChangeDependencies() {
  String path = (ModalRoute.of(context)?.settings.arguments as String);
  imageFile = File(path);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('X',style: AppTextStyle.textTitle,))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child:
            imageFile.existsSync()
                ? _editImageContain() // Hiển thị ảnh
                : Text(AppString.errorUnSelectedImage),),
            const EditButtonRow(),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }


  Widget _editImageContain(){
  return Stack(
      children: [
        Image.file(imageFile,fit: BoxFit.cover),
        const Positioned(child: Text('data'))
      ]);
  }



}


