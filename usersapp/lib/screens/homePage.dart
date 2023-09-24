import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/providers/userDataProvider.dart';
import 'package:usersapp/widgets/app_bar.dart';
import 'package:usersapp/widgets/user-card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // Function to refresh data when the user performs a swipe-down gesture
  Future<void> _refreshData(BuildContext context) async {
    final allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    await allUsersDataProvider.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    // Access the provider for user list data management
    final allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);

    return Scaffold(
      // Set background color based on dark mode
      // backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: "My Users", // Title displayed in the app bar
        ),
      ),
      // This widget allows the user to refresh the pagehence checking any data updates..
      body: RefreshIndicator( 
        onRefresh: () => _refreshData(context),
        child: ListView.builder(
          itemCount: allUsersDataProvider.allUsers.length,
          itemBuilder: (context, index) {
            final user = allUsersDataProvider.allUsers[index];
            // Use UserCard widget to display user information
            return UserCard(
              name: user.name,
              age: user.age.toString(),
              email: user.email,
            );
          },
        ),
      ),
    );
  }
}
