import 'package:flutter/material.dart';
import 'package:itelectivesix/screens/login_screen.dart';
import 'package:itelectivesix/screens/home_screen.dart';
import 'package:itelectivesix/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:itelectivesix/services/firebase_authentication.dart';
import 'package:provider/provider.dart';
import 'package:itelectivesix/models/reg_users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => Firebase_Authentication()),
      StreamProvider(
          initialData: RegUsers(),
          create: (context) => context.read<Firebase_Authentication>().getUser)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<RegUsers>(builder: (context, user, __) {
        if (user.uid == "") {
          return const LoginScreen();
        } else {
          return const HomeScreen();
        }
      }),
      title: 'Housy Appliances',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF7655ca)),
      ),
    );
  }
}
