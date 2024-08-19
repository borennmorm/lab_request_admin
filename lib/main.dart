import 'package:flutter/material.dart';
import 'package:lab_request_admin/views/check_availability.dart';
import 'package:lab_request_admin/views/login.dart';
import 'package:lab_request_admin/views/splash.dart';

import 'views/home.dart';
import 'views/manage_request.dart';
import 'views/request_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestDetail(),
    );
  }
}

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_mac_outlined),
            label: 'Availability',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
