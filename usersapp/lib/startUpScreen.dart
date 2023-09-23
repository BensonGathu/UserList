import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/providers/userDataProvider.dart';
import 'package:usersapp/screens/homePage.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StartUpScreenBody(),
    );
  }
}

class StartUpScreenBody extends StatefulWidget {
  @override
  _StartUpScreenBodyState createState() => _StartUpScreenBodyState();
}

class _StartUpScreenBodyState extends State<StartUpScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getAppData();
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _colorAnimation = _controller.drive(
      TweenSequence<Color?>(
        <TweenSequenceItem<Color?>>[
          TweenSequenceItem(
            tween: ColorTween(
              begin: Colors.red,
              end: Colors.blue,
            ),
            weight: 1.0,
          ),
        ],
      ),
    );

    _controller.repeat();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
      _navigateToDifferentPage();
    });
    super.initState();
  }

  getAppData() async {
    var allUsersDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    await allUsersDataProvider.fetchAllUsers();
  }

  void _navigateToDifferentPage() {
    if (!_isLoading) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePageScreen(),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return SpinKitFadingCircle(
            color: _colorAnimation.value!,
            size: 50.0,
          );
        },
      ),
    );
  }
}
