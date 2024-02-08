import 'package:counter/presentation/screen/home_screen.dart';
import 'package:counter/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';

import '../screen/second_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.deepOrange,
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.white,
          ),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.green,
          ),
        );

      default:
        return null;
    }
  }
}
