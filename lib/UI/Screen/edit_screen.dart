import 'dart:io';

import 'package:bapp/Constant/constant.dart';
import 'package:bapp/UI/Widget/edit_button_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key});
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
                padding: EdgeInsets.only(left: 10),
                child: Text('X',style: TextCustom.textTitle,))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child:
            imageFile.existsSync()
                ? Image.file(imageFile,fit: BoxFit.cover) // Hiển thị ảnh
                : const Text("Không có ảnh nào được chọn"),),
            const EditButtonRow(),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
