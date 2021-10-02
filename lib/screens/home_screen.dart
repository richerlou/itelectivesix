import 'package:flutter/material.dart';
import 'package:itelectivesix/screens/grid_widget.dart';
import 'package:itelectivesix/screens/profile_drawer.dart';
import 'package:itelectivesix/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Icon(Icons.home, color: gradPurple, size: 56),
            Text(
              "Housy Appliances",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: gradPurple),
      ),
      body: const GridScreen(),
      endDrawer: const ProfileDrawer(),
    );
  }
}
