import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/screen/select_image_screen.dart';
import 'package:bapp/shared/ui/widget/user_info/list_user_home.dart';
import 'package:flutter/material.dart';
import 'package:bapp/shared/ui/Widget/image_show/image_gridview.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});
  static String name = "/discovery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discovery', style: AppTextStyle.textTitle,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const ListUserHome(),
            Expanded(child: Stack(
              children: [
                const ImageGridview(),
                Positioned(
                  bottom: 50,
                  right: 50,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SelectImageScreen.name);
                    },
                    child:Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_box_rounded,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    )

                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
