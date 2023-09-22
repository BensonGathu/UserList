import 'package:flutter/material.dart';
import 'package:usersapp/screens/homePage.dart';
import 'package:usersapp/startUpScreen.dart';

class Routes {
  static const String home = '/';
  static const String startupScreen = '/startUpScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startupScreen:
        return MaterialPageRoute(builder: (_) =>const StartUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

      default:
        // Handle unknown routes here.
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Unknown route or invalid arguments.'),
        ),
      ),
    );
  }
}
