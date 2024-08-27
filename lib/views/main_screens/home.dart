import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/approval_history.dart';
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 300;

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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Ensure that the Row layout is responsive
              if (isLargeScreen)
                Row(
                  children: [
                    Expanded(
                      child: OverviewCard(
                        title: 'Total Request',
                        number: '05',
                        color: Colors.green[700]!,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: OverviewCard(
                        title: 'Pending Approve',
                        number: '05',
                        color: Colors.red[700]!,
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    OverviewCard(
                      title: 'Total Request',
                      number: '05',
                      color: Colors.green[700]!,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    OverviewCard(
                      title: 'Pending Approve',
                      number: '05',
                      color: Colors.red[700]!,
                      onTap: () {},
                    ),
                  ],
                ),
              const SizedBox(
                  height: 10), // Add some spacing before Approval History
              const Text(
                "Approval History",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 10),
              const ApprovalHistoryCard(
                title: "Rong Thida",
                date: "Requested lab [013] on [11 Aug 2024]",
                sessions: [1, 2, 3, 4, 5, 6],
                currentSessions: [1, 2, 5],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
