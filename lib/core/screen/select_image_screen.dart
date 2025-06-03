import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/constant/route.dart';
import 'package:bapp/core/screen/widget/image_show/image_list_row.dart';
import 'package:bapp/core/utils/image_helper.dart';
import 'package:bapp/feature/recently_edit_image/state/recently_edit_image_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SelectImageScreen extends ConsumerStatefulWidget {
  const SelectImageScreen({super.key});

  @override
  ConsumerState<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends ConsumerState<SelectImageScreen> {


  @override
  void initState() {
    Future.microtask(() {
      ref.read(recentlyEditImageViewModel.notifier).init();
    });
    super.initState();
  }


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
                              ImageHelper.pickImage(context);
                            }),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: _buttonSelection(buttonHeight, buttonWidth, Icons.camera_alt_outlined,(){
                            ImageHelper.pickImageEdit(context,ref);
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    _buttonSelection(buttonHeight, buttonWidth*2, Icons.social_distance, (){
                      Navigator.pushNamed(context, Routes.discoveryPath);
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
