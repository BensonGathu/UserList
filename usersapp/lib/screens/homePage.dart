import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/providers/userDataProvider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    var allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
        print(allUsersDataProvider.allUsers);
    return const Placeholder();
  }
}
