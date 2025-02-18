import 'package:bapp/UI/Widget/custom_button.dart';
import 'package:bapp/UI/Widget/image_show/image_list_row.dart';
import 'package:bapp/constant/constant.dart';
import 'package:bapp/ui/screen/discovery_screen.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';

class SelectImageScreen extends StatelessWidget {
  const SelectImageScreen({super.key});

  static String name = '/select_image';

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    double buttonHeight = screenSize.height * 0.1;
    double buttonWidth = screenSize.width * 0.45;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page', style: fTextCustom.textTitle,),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
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
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: ButtonSelection(buttonHeight, buttonWidth, Icons.picture_in_picture_rounded,(){
                              pickImage(context);
                            }),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ButtonSelection(buttonHeight, buttonWidth, Icons.add,(){
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    ButtonSelection(buttonHeight, buttonWidth*2, Icons.dashboard_customize_sharp, (){}),
                    const SizedBox(height: 7,),
                    Custombutton(text: "Discovery", color: fAppColor.colorButton, height: 30, tap: (){
                      Navigator.pushNamed(context, DiscoveryScreen.name);
                    })
                  ],),

                  //show hinh
                  const ImageListRow()
                ],
              ),
            ),

            const SizedBox(height: 100,)
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
