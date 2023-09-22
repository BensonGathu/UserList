import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/screens/homePage.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen>
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

  getAppData() {}
  void _navigateToDifferentPage() {
    if (!_isLoading) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePageScreen(),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return SpinKitFadingCircle(
              color: _colorAnimation.value!,
              size: 50.0,
            );
          },
        ),
      ),
    );
  }
}
