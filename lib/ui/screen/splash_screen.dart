import 'package:bapp/UI/Screen/select_image_screen.dart';
import 'package:bapp/UI/Widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';

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
            child: Custombutton(
                text: "Started",
                color: fAppColor.colorButton,
                height: 50,
                tap: () {
                  Navigator.pushReplacementNamed(context, SelectImageScreen.name);
                }),
          )
        ],
      ),
    );
  }
}
