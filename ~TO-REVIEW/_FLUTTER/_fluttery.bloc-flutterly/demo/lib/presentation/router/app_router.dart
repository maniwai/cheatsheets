import 'package:bloc_flutterly/presentation/screens/home_screen.dart';
import 'package:bloc_flutterly/presentation/screens/second_screen.dart';
import 'package:bloc_flutterly/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(title: 'Second Screen', color: Colors.greenAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(title: 'Third Screen', color: Colors.purpleAccent),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(title: 'Home Screen', color: Colors.blueAccent),
        );
    }
  }
}
