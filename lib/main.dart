import 'package:flutter/material.dart';
import 'package:itelectivesix/screens/login_screen.dart';
import 'package:itelectivesix/screens/home_screen.dart';
import 'package:itelectivesix/utils/routes.dart';
import 'package:itelectivesix/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const LoginScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.homeRoute: (context) => const HomeScreen(),
      },
      title: 'Housy Appliances',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF7655ca)),
      ),
    );
  }
}
