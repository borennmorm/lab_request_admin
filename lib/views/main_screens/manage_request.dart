import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_drawer.dart';
import '../../components/request_card.dart';
import '../settings.dart';

class ManageRequest extends StatefulWidget {
  const ManageRequest({super.key});

  @override
  State<ManageRequest> createState() => _ManageRequestState();
}

class _ManageRequestState extends State<ManageRequest> {
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
        title: const Text('Morm Borenn'),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // new request
              Text(
                'New Request',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RequestCard(
                date: 'Mon, 19 Aug 2024',
                name: 'Morm Borenn',
                roomNumber: '01',
                timeSlots: [
                  '01',
                  '02',
                  '03',
                  '04',
                  '05',
                  '06',
                ],
              ),
              RequestCard(
                date: 'Mon, 19 Aug 2024',
                name: 'Morm Borenn',
                roomNumber: '01',
                timeSlots: [
                  '01',
                  '02',
                  '03',
                  '04',
                  '05',
                  '06',
                ],
              ),
              // response
              Text(
                'Response',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RequestCard(
                date: 'Mon, 19 Aug 2024',
                name: 'Morm Borenn',
                roomNumber: '01',
                timeSlots: [
                  '01',
                  '02',
                  '03',
                  '04',
                  '05',
                  '06',
                ],
              ),
              RequestCard(
                date: 'Mon, 19 Aug 2024',
                name: 'Morm Borenn',
                roomNumber: '01',
                timeSlots: [
                  '01',
                  '02',
                  '03',
                  '04',
                  '05',
                  '06',
                ],
              ),
              // missed response
              Text(
                'Missed Response',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'No missing response',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
