import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../components/my_drawer.dart';
import '../../controllers/request_controller.dart';

class ManageRequest extends StatelessWidget {
  final ManageRequestController controller = Get.put(ManageRequestController());

  ManageRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy');
    final formattedDate = formatter.format(now);

    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('Request'),
        centerTitle: false,
      ),
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
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: WeekView(
                      onDateSelected: (date) {
                        controller.updateSelectedDate(date);
                      },
                    ),
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
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: controller.selectedLab.value.isNotEmpty
                                ? controller.selectedLab.value
                                : null,
                            hint: const Text(
                              'Select a lab',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.updateSelectedLab(newValue);
                              }
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
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Request',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.square_rounded,
                        color: Colors.blue,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Free',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.square_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Busy',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),
              // Session part
              Obx(() {
                return Column(
                  children: controller.requests.map((request) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: request!.isAvailable
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: request.isAvailable
                                      ? Colors.blue
                                      : Colors.orange,
                                  width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      request.timeSlot,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: request.isAvailable
                                            ? Colors.blue
                                            : Colors.orange,
                                      ),
                                    ),
                                    Text(
                                      request.userName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: request.isAvailable
                                            ? Colors.blue
                                            : Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  CupertinoIcons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class WeekView extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const WeekView({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    List<Map<String, dynamic>> getDaysOfWeek() {
      DateTime now = DateTime.now();

      return List.generate(28, (index) {
        DateTime date = now.subtract(Duration(days: 14 - index));
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

    List<Map<String, dynamic>> days = getDaysOfWeek();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: days.map((day) {
          return GestureDetector(
            onTap: () {
              onDateSelected(DateTime.now().subtract(
                Duration(days: 14 - days.indexOf(day)),
              ));
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
      ),
    );
  }
}
