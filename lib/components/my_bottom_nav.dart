import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../views/main_screens/announcement.dart';
import '../views/main_screens/check_availability.dart';
import '../views/main_screens/home.dart';
import '../views/main_screens/manage_request.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => MyBottomNaveState();
}

class MyBottomNaveState extends State<MyBottomNav> {
  int _selectedIndex = 0;

  // List of widgets for each page
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    ManageRequest(),
    CheckAvailability(),
    Announcement(),
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
              CupertinoIcons.desktopcomputer,
              size: 25,
            ),
            label: 'Availability',
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
