import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itelectivesix/models/reg_users.dart';
import 'package:itelectivesix/services/firebase_authentication.dart';
import 'package:itelectivesix/views/admin/home_ui.dart';
import 'package:itelectivesix/views/signin/login_ui.dart';
import 'package:provider/provider.dart';
import 'package:itelectivesix/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => Firebase_Authentication(),
      ),
      StreamProvider(
        initialData: RegUsers(),
        create: (context) => context.read<Firebase_Authentication>().getUser,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Housy Appliances',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF7655ca)),
      ),
      debugShowCheckedModeBanner: false,
      home: Consumer<RegUsers>(builder: (context, user, __) {
        if (user.uid == "") {
          return const LoginScreen();
        } else {
          return const Home();
        }
      }),
    );
  }
}
