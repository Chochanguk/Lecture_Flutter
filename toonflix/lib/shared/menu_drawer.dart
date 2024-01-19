import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            accountName: const Text('Chochanguk'),
            accountEmail: const Text('changuk0308@gmail.com'),
            onDetailsPressed: () {},
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            iconColor: const Color(0xFFE7626C),
            focusColor: const Color(0xFFE7626C),
            title: const Text('홈'),
            onTap: () {},
            trailing: const Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_rounded),
            iconColor: const Color(0xFFE7626C),
            focusColor: const Color(0xFFE7626C),
            title: const Text('쇼핑'),
            onTap: () {},
            trailing: const Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon(Icons.mark_as_unread_sharp),
            iconColor: const Color(0xFFE7626C),
            focusColor: const Color(0xFFE7626C),
            title: const Text('편지함'),
            onTap: () {},
            trailing: const Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon(Icons.restore_from_trash),
            iconColor: const Color(0xFFE7626C),
            focusColor: const Color(0xFFE7626C),
            title: const Text('휴지통'),
            onTap: () {},
            trailing: const Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            iconColor: const Color(0xFFE7626C),
            focusColor: const Color(0xFFE7626C),
            title: const Text('설정'),
            onTap: () {},
            trailing: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
