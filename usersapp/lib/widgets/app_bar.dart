import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  // Constructor to receive the title text
  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title), // Display the provided title text in the app bar
    );
  }
}
