import 'package:duyguriverpod/screens/login_screen.dart';
import 'package:duyguriverpod/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final box = await SharedPreferences.getInstance();
      if (box.getString("token") != null) {
        Grock.toRemove(const UsersScreen());
      } else {
        Grock.toRemove(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 16.0, end: 36),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, double size, Widget? child) {
            return Text(
              'Hoşgeldiniz',
              style: TextStyle(fontSize: size, color: Colors.orange),
            );
          },
        ),
      ),
    );
  }
}
