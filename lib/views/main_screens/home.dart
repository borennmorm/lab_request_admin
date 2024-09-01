import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_drawer.dart';
import '../settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  // Use Expanded to equally distribute space in the row
                  Expanded(
                    child: OverviewCard(
                      title: 'Total Request',
                      number: '05',
                      color: Colors.green[700]!,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: OverviewCard(
                      title: 'Pending ',
                      number: '05',
                      color: Colors.red[700]!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  // Use Expanded to equally distribute space in the row
                  Expanded(
                    child: OverviewCard(
                      title: 'Approve',
                      number: '05',
                      color: Colors.blue[700]!,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: OverviewCard(
                      title: 'Reject',
                      number: '05',
                      color: Colors.orange[700]!,
                    ),
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

class OverviewCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color;

  const OverviewCard({
    super.key,
    required this.title,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
