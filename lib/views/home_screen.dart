import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import 'components/my_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    updateOverview();
  }

  void updateOverview() {
    // Update the overview data based on the current requests
    controller.totalRequests.value = controller.getTotalRequestsForToday();
    controller.pendingApprovals.value = controller.getTotalPendingRequests();
    controller.approvedRequests.value =
        controller.getTotalApprovedRequestsForToday();
    controller.rejectedRequests.value =
        controller.getTotalRejectedRequestsForToday();
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
        title: const Text('Dashboard'),
        centerTitle: false,
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
                    child: Obx(
                      () => OverviewCard(
                        title: 'Total Request',
                        number: controller.totalRequests.toString(),
                        color: Colors.green[700]!,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Obx(
                      () => OverviewCard(
                        title: 'Pending',
                        number: controller.pendingApprovals.toString(),
                        color: Colors.red[700]!,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  // Use Expanded to equally distribute space in the row
                  Expanded(
                    child: Obx(
                      () => OverviewCard(
                        title: 'Approve',
                        number: controller.approvedRequests.toString(),
                        color: Colors.blue[700]!,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Obx(
                      () => OverviewCard(
                        title: 'Reject',
                        number: controller.rejectedRequests.toString(),
                        color: Colors.orange[700]!,
                      ),
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
