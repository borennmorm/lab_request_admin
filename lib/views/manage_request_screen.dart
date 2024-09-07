import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/controller.dart';
import '../models/model.dart';
import 'components/my_drawer.dart';
import 'request_detail.dart';

class ManageRequest extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  ManageRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, dd MMM yyyy');
    final formattedDate = formatter.format(now);

    // Map of session times to their corresponding numbers
    final Map<String, String> sessionMap = {
      '07:00 AM - 08:30 AM': '1',
      '08:50 AM - 10:20 AM': '2',
      '10:50 AM - 12:00 PM': '3',
      '01:00 PM - 02:30 PM': '4',
      '02:50 PM - 04:20 PM': '5',
      '04:30 PM - 05:30 PM': '6',
    };

    return Scaffold(
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
                        formattedDate,
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
              const SizedBox(height: 20),
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
                            value: controller.selectedLab.value,
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
                              'Engineering Lab',
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
              const SizedBox(height: 10),

              // Request Cards Section
              const Text(
                'Requests',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Displaying requests as cards
              Obx(() {
                List<RequestModel> filteredRequests =
                    controller.getFilteredRequests();

                // Check if there are no requests for the selected date
                if (filteredRequests.isEmpty) {
                  return const Center(
                      child:
                          Text('No requests for the selected date and lab.'));
                }

                // Filter requests where requests is pending
                List<RequestModel> pendingRequests = filteredRequests
                    .where((request) =>
                        request.requestStatus == RequestStatus.pending)
                    .toList();

                // Check if there are no pending requests
                if (pendingRequests.isEmpty) {
                  return const Center(
                    child: Text('No pending requests'),
                  );
                }

                // Display the requests in a loop with cards
                return ListView.builder(
                  shrinkWrap: true, // Allows ListView inside a ScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredRequests.length,
                  itemBuilder: (context, index) {
                    final request = filteredRequests[index];

                    // Define a Map that associates LabStatus with specific colors
                    final Map<LabStatus, Color> labStatusColors = {
                      LabStatus.isAvailable: Colors.green,
                      LabStatus.isNotAvailable: Colors.orange,
                      LabStatus.maintenance: Colors.red,
                    };

                    // Get the container color from the map
                    Color containerColor =
                        labStatusColors[request.isAvailable] ?? Colors.grey;
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => RequestDetailScreen(request: request));
                      },
                      child: Card(
                        // color: containerColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: containerColor,
                            width: 2,
                          ),
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    request.username,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    request.requestStatus.name.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.schedule),
                                  const SizedBox(width: 8),
                                  // Display session numbers instead of times with individual bordered containers
                                  Row(
                                    children: request.session.map((time) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              sessionMap[time] ?? time,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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

  WeekView({super.key, required this.onDateSelected});

  // Track the selected date
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> getDaysOfWeek() {
      DateTime now = DateTime.now();

      return List.generate(14, (index) {
        DateTime date = now.subtract(Duration(days: 7 - index));
        return {
          "day": DateFormat('EEE').format(date),
          "date": date.day.toString(),
          "dateTime": date,
          "isToday": date.day == now.day &&
              date.month == now.month &&
              date.year == now.year,
        };
      });
    }

    return Obx(() {
      List<Map<String, dynamic>> days = getDaysOfWeek();
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: days.map((day) {
            bool isSelected = selectedDate.value.day == day['dateTime'].day &&
                selectedDate.value.month == day['dateTime'].month &&
                selectedDate.value.year == day['dateTime'].year;

            return GestureDetector(
              onTap: () {
                selectedDate.value = day['dateTime'];
                onDateSelected(day['dateTime']);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 60,
                  height: 90,
                  decoration: BoxDecoration(
                    color: day['isToday']
                        ? Colors.blue.shade200
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
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
    });
  }
}
