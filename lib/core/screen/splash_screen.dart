import 'package:bapp/core/constant/app_color.dart';
import 'package:bapp/core/constant/constant.dart';
import 'package:bapp/core/constant/route.dart';
import 'package:bapp/core/screen/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            child: Image.network(
              ImageUrl.plashImage,
              fit: BoxFit.fill,
            ),
          ),

          const Center(child: Text('Create your design',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,
            fontSize: 60,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.blueGrey,
                offset: Offset(4.0, 10.0),
                blurRadius: 4.0,
              )
            ]
          ),)),
          Positioned(
            left: 40,
            right: 40,
            bottom: 70,
            child: CustomButton(
                text: "Started",
                color: AppColors.colorButton,
                height: 50,
                tap: () {
                  Navigator.pushReplacementNamed(context, Routes.selectImagePath);
                }),
          )
        ],
      ),
    );
  }
}
