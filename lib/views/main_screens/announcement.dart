import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_button.dart';
import '../../components/my_drawer.dart';
import '../../components/my_textfield.dart';
import '../settings.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isAllSelected = false;
  bool _isSingleSelected = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: const Text('Announcement'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(const Settings());
              },
              icon: const Icon(Icons.settings),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'History'),
              Tab(text: 'Create'),
            ],
          ),
        ),
        // Drawer
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    '11 August 2024 - 9:00 AM',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  // History Card
                  const AnnouncementHistoryCard(
                    title: 'Rong Thida',
                    message:
                        'Your request for [Lab 013] on [09 August 2024, 9:00 AM] has been approved.',
                    type: 'Signle',
                  ),
                  const SizedBox(height: 10),

                  const AnnouncementHistoryCard(
                    title: 'Morm Borenn',
                    message:
                        'Your request for [Lab 014] on [09 August 2024, 9:00 AM] has been approved.',
                    type: 'Signle',
                  ),
                  const SizedBox(height: 20),

                  // Date
                  Text(
                    '10 August 2024 - 9:00 AM',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  // History Card
                  const AnnouncementHistoryCard(
                    title: 'Announcement',
                    message:
                        'Note: Lab 014 can not request because it under maintenance.',
                    type: 'All',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Input Box
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Teacher',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Teacher Search Results
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Rong Thida',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Checkboxes (All, Single)
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text("All"),
                          value: _isAllSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isAllSelected = value ?? false;
                              if (_isAllSelected) {
                                _isSingleSelected = false;
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text("Single"),
                          value: _isSingleSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isSingleSelected = value ?? false;
                              if (_isSingleSelected) {
                                _isAllSelected = false;
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description Label
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // Description Input Text Box
                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter description here...',
                    ),
                  ),
                  const SizedBox(height: 10),

                  // button
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: Colors.blue,
                          onPressed: () {},
                          text: 'Submit',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Histroy Card
class AnnouncementHistoryCard extends StatelessWidget {
  final String title;
  final String message;
  final String type;

  const AnnouncementHistoryCard({
    super.key,
    required this.title,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Announcement type
              Text(
                type,
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
