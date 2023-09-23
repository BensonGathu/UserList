import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String age;
  final String email;

  // Constructor to receive user information
  UserCard({
    required this.name,
    required this.age,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    // Display user information in a card
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          'Age: $age, Email: $email', // Display age and email information
          style: TextStyle(
            fontSize: 14.0,
            color: isDarkMode ? Colors.grey : Colors.black87,
          ),
        ),
      ),
    );
  }
}
