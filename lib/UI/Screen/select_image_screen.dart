import 'package:bapp/UI/Widget/image_show/image_list_row.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';

class SelectImageScreen extends StatelessWidget {
  const SelectImageScreen({super.key});

  static String name = '/select_image';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xxx'),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          children: [
            const SizedBox(height: 180,),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //button
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonSelection(70, 200, Icons.picture_in_picture_rounded,(){
                          pickImage(context);
                        }),
                        SizedBox(width: 7,),
                        ButtonSelection(70, 200, Icons.add,(){
                        }),
                      ],
                    ),
                    SizedBox(height: 7,),
                    ButtonSelection(70, 407, Icons.dashboard_customize_sharp, (){}),
                  ],),
              
                  //show hinh
                  ImageListRow()
                ],
              ),
            ),

            SizedBox(height: 100,)
          ],
        )
      ),
    );
  }
}

Widget  ButtonSelection(double h, double w, IconData icon, Function tap){
  return InkWell(
    onTap: () => tap(),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(icon ,size: 40,color: Colors.redAccent,)
    ),
  );
}
