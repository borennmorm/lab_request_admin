import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../components/my_drawer.dart';
import '../settings.dart';

class CheckAvailability extends StatefulWidget {
  const CheckAvailability({super.key});

  @override
  State<CheckAvailability> createState() => _CheckAvailabilityState();
}

class _CheckAvailabilityState extends State<CheckAvailability> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedLab;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, dd MMM yyyy');
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
        title: const Text('Check Availability'),
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
                        formattedDate,
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
              const SizedBox(height: 20),
              // Lab status section in a single row
              Row(
                children: [
                  Expanded(
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
                      items: <String>['013', '014', '015']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 90),
                  // Lab status indicators
                  const Row(
                    children: [
                      Icon(
                        Icons.square_rounded,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Free',
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.square_rounded,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Busy',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              // First Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rong Thida',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Second Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  border: Border.all(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Free',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Third Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rong Thida',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Third Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rong Thida',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Third Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rong Thida',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Third Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '07:00 - 08:30 AM',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rong Thida',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
