import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAvatarCircle extends StatelessWidget {
  const UserAvatarCircle({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 80,
        width: 80,
        decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: ClipOval(
            child: Image.network(
          image,
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
