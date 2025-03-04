import 'package:bapp/UI/Screen/edit_screen.dart';
import 'package:bapp/UI/Screen/select_image_screen.dart';
import 'package:bapp/ui/screen/discovery_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/discovery':
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
      case '/select_image':
        return MaterialPageRoute(builder: (_) => const SelectImageScreen());
      case '/filter':
        return MaterialPageRoute(builder: (_) => EditScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
    }
  }
}
