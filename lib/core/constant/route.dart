
import 'dart:io';

import 'package:bapp/core/screen/discovery_screen.dart';
import 'package:bapp/core/screen/select_image_screen.dart';
import 'package:bapp/feature/preview_image/screen/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:bapp/feature/edit_image/screen/edit_screen.dart';










class Routes {

  //path
  static const String previewPath = '/preview';
  static const String discoveryPath = '/discovery';
  static const String selectImagePath = '/select_image';
  static const String editPath = '/filter';
  static const String splashPath = '/splash';

  //name
  static const String preview = 'preview';
  static const String discovery = 'discovery';
  static const String selectImage = 'select_image';
  static const String edit = 'filter';
  static const String splash = 'splash';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/discovery':
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
      case '/select_image':
        return MaterialPageRoute(builder: (_) => const SelectImageScreen());
      case '/edit':
        return MaterialPageRoute(builder: (_) => const EditScreen(),
          settings: settings,
        );
      case '/preview':
        return MaterialPageRoute(builder: (_) {
          final data = settings.arguments as File;
          return PreviewScreen(file: data);
        },
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
    }
  }
}
