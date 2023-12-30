import 'package:flutter/material.dart';

enum SampleItem { logout }

class DrawerNavigationWidget extends StatefulWidget {
  final String Email;
  final String email;

  const DrawerNavigationWidget({
    super.key,
    this.Email = 'Email',
    this.email = 'your_email@example.com',
  });

  @override
  State<DrawerNavigationWidget> createState() => _DrawerNavigationWidgetState();
}

class _DrawerNavigationWidgetState extends State<DrawerNavigationWidget> {
  Widget _buildDrawerItem(icon, name, context, routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(children: [
              const Icon(Icons.person_2),
              Text(
                widget.Email,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          _buildDrawerItem(Icons.home, 'Dashboard', context, '/landing'),
          _buildDrawerItem(Icons.class_, 'Flashcards', context, '/flashcards'),
          _buildDrawerItem(
              Icons.list, 'Reminders', context, '/reminders'),
          _buildDrawerItem(Icons.timer, 'Countdown', context, '/countdown'),
          _buildDrawerItem(Icons.logout, 'Logout', context, '/'),
        ],
      ),
    );
  }
}
