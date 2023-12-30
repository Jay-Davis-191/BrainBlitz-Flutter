import 'package:flutter/material.dart';

enum SampleItem { logout }

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  // Set preferredSize of App Bar
  Size get preferredSize => const Size.fromHeight(50);
}

class _CommonAppBarState extends State<CommonAppBar> {
  SampleItem? selectedMenu;

  void _handleLogout() {
    debugPrint('Logout');
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                debugPrint('Settings pressed!');
                showMenu<SampleItem>(
                  context: context,
                  position:
                      const RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                  items: [
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.logout,
                      child: Text('Logout'),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedMenu = value;
                      if (value == SampleItem.logout) {
                        _handleLogout();
                      }
                    });
                  }
                });
              })
        ]);
  }
}
