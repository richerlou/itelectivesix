import 'package:flutter/material.dart';
import 'package:itelectivesix/constants.dart';

const padding = EdgeInsets.symmetric(horizontal: 20);
const name = 'Adrian Cabahug';
const email = 'abcabahug@addu.edu.ph';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({Key? key}) : super(key: key);
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
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
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child:
                          (Icon(Icons.person, size: 35, color: Colors.black)),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: const [
                        Text(name,
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text(email,
                            style: TextStyle(fontSize: 12, color: Colors.white))
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
            const SizedBox(height: 24),
            Container(
                padding: padding, child: const Divider(color: Colors.white70)),
            const SizedBox(height: 24),
            buildMenuItem(text: 'Sign Out', icon: Icons.exit_to_app_rounded),
            buildMenuItem(text: 'Help', icon: Icons.help),
          ],
        ),
      ),
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
