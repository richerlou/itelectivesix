import 'package:flutter/material.dart';
import 'package:itelectivesix/services/firebase_authentication.dart';
import 'package:itelectivesix/views/signin/login_ui.dart';
import 'package:itelectivesix/views/admin/createitem.dart';
import 'package:itelectivesix/constants.dart';

const padding = EdgeInsets.symmetric(horizontal: 20);

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradPurple, gradPink, gradYellow],
        )),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(Firebase_Authentication()
                                .getCurrentUser(context)
                                .photoUrl),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                            Firebase_Authentication()
                                .getCurrentUser(context)
                                .displayName,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                        Text(
                            Firebase_Authentication()
                                .getCurrentUser(context)
                                .email,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white))
                      ],
                    ),
                  ],
                )),
            buildMenuItem(
                text: 'My Purchases',
                icon: Icons.account_balance_wallet_rounded),
            buildMenuItem(
                text: 'Favorites', icon: Icons.favorite_border_rounded),
            buildMenuItem(text: 'Recently Viewed', icon: Icons.history_rounded),
            buildMenuItem(text: 'Settings', icon: Icons.settings_rounded),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              hoverColor: Colors.white70,
              title: Text(
                'Add Item',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateItem()));
              },
            ),
            const SizedBox(height: 24),
            Container(
                padding: padding, child: const Divider(color: Colors.white70)),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              hoverColor: Colors.white70,
              onTap: () async {
                Firebase_Authentication().logOut(context).whenComplete(() {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (dcontext) => const LoginScreen()),
                      (route) => false);
                });
              },
            ),
            buildMenuItem(text: 'Help', icon: Icons.help),
          ],
        ),
      ),

      // ListView(
      //   padding: EdgeInsets.zero,
      //   children: [
      //     const DrawerHeader(
      //       decoration: BoxDecoration(
      //         color: Colors.black45,
      //       ),
      //       child: Text('Drawer Header'),
      //     ),
      //     ListTile(
      //       title: const Text('Item 1'),
      //       onTap: () {
      //         // Update the state of the app.
      //         // ...
      //       Navigator.pop(context);
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('Item 2'),
      //       onTap: () {
      //         // Update the state of the app.
      //         // ...
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }
}
