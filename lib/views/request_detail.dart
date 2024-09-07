import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/session_controller.dart';
import '../models/model.dart';

class RequestDetailScreen extends StatelessWidget {
  final RequestModel request;
  final SessionController sessionController = Get.put(SessionController());

  RequestDetailScreen({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${request.id}', style: TextStyle(fontSize: 16)),
            Text('Username: ${request.username}',
                style: TextStyle(fontSize: 16)),
            Text('Phone: ${request.phone}', style: TextStyle(fontSize: 16)),
            Text('Lab: ${request.lab}', style: TextStyle(fontSize: 16)),
            Text('Date: ${request.date}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Sessions List
            Text('Select Sessions:', style: TextStyle(fontSize: 16)),
            Obx(() {
              return Column(
                children: request.session.map((time) {
                  return CheckboxListTile(
                    title: Text(time),
                    value: sessionController.selectedSessions[time] ?? false,
                    onChanged: (bool? value) {
                      sessionController.toggleSessionSelection(time);
                    },
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 16),

            // Description box
            Text('Notification:', style: TextStyle(fontSize: 16)),
            TextField(
              maxLines: 4,
              onChanged: (value) {
                sessionController.notificationMessage.value = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write a message for the user...',
              ),
            ),
            const SizedBox(height: 16),

            // Approve and Reject buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Approve selected sessions
                    handleApproval(sessionController.selectedSessions, true);
                  },
                  child: Text("Approve Selected"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Reject selected sessions
                    handleApproval(sessionController.selectedSessions, false);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Reject Selected"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle approval/rejection
  void handleApproval(Map<String, bool> selectedSessions, bool isApproved) {
    final selectedSessionList = selectedSessions.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedSessionList.isEmpty) {
      Get.snackbar('Error', 'Please select at least one session.');
      return;
    }

    // Example: Sending notification and handling logic
    String message = isApproved
        ? 'The following sessions have been approved:\n'
        : 'The following sessions have been rejected:\n';

    message += selectedSessionList.join('\n');
    message += '\n\nMessage: ${sessionController.notificationMessage.value}';

    // TODO: Add logic to update the session status in the backend

    Get.snackbar(
        'Success', isApproved ? 'Sessions approved!' : 'Sessions rejected!');
    sessionController.resetSelections();
  }
}
