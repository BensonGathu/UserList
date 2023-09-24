import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/providers/userDataProvider.dart';
import 'package:usersapp/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
      // Instantiating our providers
      MultiProvider(
    providers: [
      ChangeNotifierProvider<UserDataProvider>(
        create: (context) => UserDataProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure initialization if needed
    // Example: WidgetsFlutterBinding.ensureInitialized();

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
