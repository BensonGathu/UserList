import 'package:flutter/material.dart';
import 'package:usersapp/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // _handleFirebase();
    // setupInteractedMessage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users',
      theme: ThemeData.light(),
      navigatorKey: navigatorKey,
      darkTheme: ThemeData.dark(),
      initialRoute: '/startUpScreen',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
