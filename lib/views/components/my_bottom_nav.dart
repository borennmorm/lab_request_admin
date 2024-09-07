import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../announcement.dart';
import '../home_screen.dart';
import '../manage_request_screen.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => MyBottomNaveState();
}

class MyBottomNaveState extends State<MyBottomNav> {
  int _selectedIndex = 0;

  // List of widgets for each page
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    ManageRequest(),
    const Announcement(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Prevents shifting behavior
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.rectangle_grid_2x2_fill,
              size: 25,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.text_badge_checkmark,
              size: 25,
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.create,
              size: 25,
            ),
            label: 'Announcement',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
