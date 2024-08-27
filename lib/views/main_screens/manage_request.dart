import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/approval_card.dart';
import 'package:intl/intl.dart';
import '../../components/my_drawer.dart';
import '../request_detail.dart';
import '../settings.dart';

class ManageRequest extends StatefulWidget {
  const ManageRequest({super.key});

  @override
  State<ManageRequest> createState() => _ManageRequestState();
}

class _ManageRequestState extends State<ManageRequest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedLab;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy');
    final formattedDate = formatter.format(now);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Request Management'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date & actual date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Today, $formattedDate',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  // Card of upcoming 7 days
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: WeekView(),
                  ),
                ],
              ),
              // Lab Selection
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButtonFormField<String>(
                          value: _selectedLab,
                          hint: const Text(
                            'Select a lab',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLab = newValue;
                            });
                          },
                          items: <String>[
                            '010',
                            '011',
                            '013',
                            'Programming Lab',
                            'Networking Lab',
                            'Computer of Engineering Lab'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Session part
              Column(children: [
                // 07:00 - 08:30 AM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const ApprovalsCard(name: 'Udom Leakana'),
                const ApprovalsCard(name: 'Udom Wathana'),

                // 08:50 - 10:20 AM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '07:50 - 10:20 AM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                const ApprovalsCard(name: 'Udom Leakana'),

                // 10:40 - 12:00 AM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '10:40 - 12:00 AM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                const ApprovalsCard(name: 'Udom Leakana'),

                // 01:00 - 02:30 PM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '01:00 - 02:30 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                const ApprovalsCard(name: 'Udom Leakana'),

                // 02:50 - 04:10 PM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '02:50 - 04:10 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                Text('None'),
                // 04:20 - 05:20 PM
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '04:20 - 05:20 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                Text('None'),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class WeekView extends StatefulWidget {
  const WeekView({super.key});

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  DateTime selectedDate = DateTime.now();

  List<Map<String, dynamic>> getDaysOfWeek() {
    DateTime now = DateTime.now();
    return List.generate(14, (index) {
      DateTime date = now.add(Duration(days: index));
      return {
        "day": DateFormat('EEE').format(date),
        "date": date.day.toString(),
        "isSelected": date.day == selectedDate.day,
        "isToday": date.day == now.day &&
            date.month == now.month &&
            date.year == now.year,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> days = getDaysOfWeek();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: days.map((day) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = DateTime.now().add(
                Duration(days: days.indexOf(day)),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: day['isSelected']
                    ? Colors.blue.shade200
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
                border: day['isToday']
                    ? Border.all(color: Colors.blue, width: 3)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day['day'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    day['date'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
