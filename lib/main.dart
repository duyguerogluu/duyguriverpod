import 'package:duyguriverpod/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock.navigationKey, // added line
      scaffoldMessengerKey: Grock.scaffoldMessengerKey, // added line
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
