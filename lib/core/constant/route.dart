
import 'package:bapp/shared/ui/screen/discovery_screen.dart';
import 'package:bapp/core/screen/select_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:bapp/feature/edit_image/screen/edit_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/discovery':
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
      case '/select_image':
        return MaterialPageRoute(builder: (_) => const SelectImageScreen());
      case '/filter':
        return MaterialPageRoute(builder: (_) => const EditScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const DiscoveryScreen());
    }
  }
}
