import 'package:flutter/material.dart';

import '../components/lab_session_card.dart';
import '../components/my_drawer.dart';
import '../components/overview_card.dart';
import '../models/overview_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<Map<String, int>> overviewData;

  @override
  void initState() {
    super.initState();
    OverviewModel model = OverviewModel();
    overviewData = model.fetchData();
  }

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
        title: const Text('Morm Borenn'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // Grid of 2x2 cards
              SizedBox(
                height: 330, // Fixed height for GridView
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    OverviewCard(
                      title: 'Total',
                      number: '05',
                      color: Colors.amber[700]!,
                    ),
                    const OverviewCard(
                      title: 'Approved',
                      number: '05',
                      color: Colors.green,
                    ),
                    const OverviewCard(
                      title: 'Rejected',
                      number: '05',
                      color: Colors.red,
                    ),
                    const OverviewCard(
                      title: 'Upcoming Sessions',
                      number: '05',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              // Labs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Labs',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All'),
                  )
                ],
              ),
              SizedBox(
                height: 330,
                child: Column(
                  children: [
                    LabSessionCard(
                      backgroundColor: Colors.amber[700]!,
                      labNumber: '01',
                      labTitle: 'Labs 013',
                      lineBarColor: Colors.amber[700]!,
                      sessionText: '2/6',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LabSessionCard(
                      backgroundColor: Colors.green,
                      labNumber: '02',
                      labTitle: 'Labs 014',
                      lineBarColor: Colors.green,
                      sessionText: '2/6',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LabSessionCard(
                      backgroundColor: Colors.red,
                      labNumber: '03',
                      labTitle: 'Labs 015',
                      lineBarColor: Colors.red,
                      sessionText: '2/6',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
