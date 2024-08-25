import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/lab_session_card.dart';
import '../../components/my_drawer.dart';
import '../../components/overview_card.dart';
import '../settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<Map<String, int>> overviewData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Dashboard'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const Settings());
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      // Drawer
      drawer: const MyDrawer(),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overview
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverviewCard(
                    title: 'Total',
                    number: '05',
                    color: Colors.green[700]!,
                  ),
                  OverviewCard(
                    title: 'Pending Approve',
                    number: '05',
                    color: Colors.red[700]!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
