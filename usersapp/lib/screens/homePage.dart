import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/providers/userDataProvider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<void> _refreshData(BuildContext context) async {
    final allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    await allUsersDataProvider.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    final allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);

    return Scaffold(
      // backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('User List'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(context),
        child: ListView.builder(
          itemCount: allUsersDataProvider.allUsers.length,
          itemBuilder: (context, index) {
            final user = allUsersDataProvider.allUsers[index];
            return Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? Colors.white 
                        : Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Age: ${user.age.toString()}, Email: ${user.email}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: isDarkMode
                        ? Colors.grey 
                        : Colors.black87,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
