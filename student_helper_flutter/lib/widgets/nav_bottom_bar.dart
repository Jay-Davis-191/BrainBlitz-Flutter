import 'package:flutter/material.dart';

class MobileBottomNavBar extends StatefulWidget {
  const MobileBottomNavBar({super.key});

  @override
  State<MobileBottomNavBar> createState() => _MobileBottomNavBarState();
}

class _MobileBottomNavBarState extends State<MobileBottomNavBar> {
  int _selectedIndex = 1;

  int _determineCurrentIndex() {
    final currentRoute = ModalRoute.of(context);
    if (currentRoute != null) {
      final routeName = currentRoute.settings.name;
      debugPrint('Current Route: $routeName');

      switch (routeName) {
        case '/avatar':
          return 0;
        case '/studentLanding':
          return 1;
        case '/questBoard':
          return 2;
        case '/mastery':
          return 0;
        case '/suggestion':
          return 1;
        case '/classBoard':
          return 1;
        default:
          return 0;
      }
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/avatar');
        break;
      case 1:
        Navigator.pushNamed(context, '/studentLanding');
        break;
      case 2:
        Navigator.pushNamed(context, '/questBoard');
        break;
      default:
        Navigator.pushNamed(context, '/');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Avatar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: 'Quests',
        ),
      ],
      currentIndex: _determineCurrentIndex(),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
      unselectedLabelStyle: const TextStyle(color: Colors.blueGrey),
      selectedLabelStyle: const TextStyle(color: Colors.red),
      onTap: _onItemTapped,
    );
  }
}
