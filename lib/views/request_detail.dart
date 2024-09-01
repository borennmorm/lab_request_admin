import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/my_button.dart';

class RequestDetail extends StatefulWidget {
  final String name;

  const RequestDetail({super.key, required this.name});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  bool isRejected = false;
  bool isApproved = false;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.isNotEmpty ? widget.name : 'Unnamed Request'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lab Details
              const Text(
                'Lab Details',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.device_desktop,
                labelText: 'Lab Name:',
                resultText: 'Lab 014',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.calendar,
                labelText: 'Request Date:',
                resultText: '12 Aug 2024',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.clock,
                labelText: 'Session Time:',
                resultText: '07:00 - 08:30 AM',
              ),
              const SizedBox(height: 20),

              // Contact Information
              const Text(
                'Contact Information',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.phone,
                labelText: 'Phone:',
                resultText: '096712123',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.creditcard,
                labelText: 'Teacher ID:',
                resultText: 'TNUBB-012',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.building_2_fill,
                labelText: 'Faculty:',
                resultText: 'Seciene and Technology',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.square_stack_3d_up,
                labelText: 'Major:',
                resultText: 'Information Technology',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.chart_bar,
                labelText: 'Generation:',
                resultText: '18',
              ),
              const SizedBox(height: 20),

              // Course Information
              const Text(
                'Course Information',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.book,
                labelText: 'Course Name:',
                resultText: 'Data Structure & Alorithm',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.device_laptop,
                labelText: 'Software Requirements:',
                resultText: 'VSCode',
              ),
              const SizedBox(height: 20),

              // Session Details
              const Text(
                'Session Details',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.person_2,
                labelText: 'Students: ',
                resultText: '<40',
              ),
              const SizedBox(height: 10),
              const RowLab(
                icon: CupertinoIcons.doc_plaintext,
                labelText: 'Additional: ',
                resultText:
                    'I need 2 speaks and a microphone. Make sure all the computer connected to internet. Thank you!',
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Checkbox row for approval and rejection
                  Row(
                    children: [
                      Checkbox(
                        value: isApproved,
                        onChanged: (bool? value) {
                          setState(() {
                            isApproved = value ?? false;
                            if (isApproved) isRejected = false;
                          });
                        },
                      ),
                      const Text(
                        'Approve',
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(width: 20),
                      Checkbox(
                        value: isRejected,
                        onChanged: (bool? value) {
                          setState(() {
                            isRejected = value ?? false;
                            if (isRejected) isApproved = false;
                          });
                        },
                      ),
                      const Text(
                        'Reject',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Description text field
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Enter description here...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Submit button
                  Center(
                      child: CustomButton(
                    color: Colors.blue,
                    onPressed: () {},
                    text: 'Submit',
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowLab extends StatelessWidget {
  final String labelText;
  final String resultText;
  final IconData icon;

  const RowLab({
    super.key,
    required this.labelText,
    required this.resultText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            labelText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 10, // Spacing between label and result
        ),
        Expanded(
          child: Text(
            resultText,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
