import 'package:flutter/material.dart';
import 'package:usersapp/screens/homePage.dart';
import 'package:usersapp/startUpScreen.dart';

class Routes {
  static const String home = '/';
  static const String startupScreen = '/startUpScreen';

  // Route generation logic based on route settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startupScreen:
        // Navigate to the StartUpScreen route
        return MaterialPageRoute(builder: (_) => const StartUpScreen());
      case home:
        // Navigate to the HomePageScreen route
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

      default:
        // Handle unknown routes here.
        return _errorRoute();
    }
  }

  // Route for handling unknown routes or invalid arguments
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
