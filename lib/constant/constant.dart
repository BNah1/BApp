import 'package:flutter/material.dart';

class ImageUrl {
  static String plashImage =
      "https://wallpaper.forfun.com/fetch/e9/e9053fbd28209d9da30a09366c4bad5f.jpeg";
  static String avatar1 =
      "https://anhnail.com/wp-content/uploads/2024/11/anh-avatar-naruto-1.jpg";
  static String avatar2 =
      "https://i.pinimg.com/736x/52/2a/75/522a75515030024d489a1831016d894d.jpg";
  static String avatar3 =
      "https://mycollectorsoutpost.com/cdn/shop/files/pain-naruto-shippuden-legacy-portrait-art-print2_550x.jpg?v=1689004283";
  static String avatar4 =
      "https://anhnail.com/wp-content/uploads/2024/11/gaara-naruto-4k.jpg";
}

class fAppColor {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color colorButton = Colors.lightBlueAccent;
}

class fTextCustom {
  static TextStyle textTitle = const TextStyle(
    color: fAppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}

enum EnumSettings {settings , logout }
enum EnumEdit {Crop , Canvas, Filters, Effect, Text, Frame, none }
