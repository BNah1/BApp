import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/shared/ui/widget/image_show/image_list_row.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../shared/ui/screen/discovery_screen.dart';

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
        title: Text('Home Page', style: AppTextStyle.textTitle,),
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
                            child: _buttonSelection(buttonHeight, buttonWidth, Icons.image_outlined,(){
                              AppHelper.pickImage(context);
                            }),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: _buttonSelection(buttonHeight, buttonWidth, Icons.camera_alt_outlined,(){
                            AppHelper.pickImageEdit(context);
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    _buttonSelection(buttonHeight, buttonWidth*2, Icons.social_distance, (){
                      Navigator.pushNamed(context, DiscoveryScreen.name);
                    }),
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

Widget  _buttonSelection(double h, double w, IconData icon, Function tap){
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
