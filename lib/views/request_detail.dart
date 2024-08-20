import 'package:flutter/material.dart';

import '../components/my_button.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({super.key});

  @override
  _RequestDetailState createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  final requestDetails = {
    'Lab': '013',
    'Date': 'Mon, 19 Aug 2024',
    'Phone': '0912747332',
    'Major': 'Accounting',
    'Subject': 'Computer Practice',
    'Software Use': 'Ms Excel',
    'Student Quantity': '>50',
    'Sessions': '2',
    'Additional': 'I want ...',
  };

  final List<String> timeSlots = [
    '07:00 - 08:30 AM',
    '08:45 - 10:15 AM',
    '10:30 - 12:00 PM',
    '12:15 - 01:45 PM',
    '02:00 - 03:30 PM',
    '03:45 - 05:15 PM'
  ];

  // Track the state of approval/rejection
  List<String> approvalStatus = [];
  List<bool> selectedForApproval = [];
  List<bool> selectedForRejection = [];

  @override
  void initState() {
    super.initState();
    int slotCount = _isWeekend() ? 6 : 3;
    approvalStatus = List<String>.filled(slotCount, 'pending');
    selectedForApproval = List<bool>.filled(slotCount, false);
    selectedForRejection = List<bool>.filled(slotCount, false);
  }

  bool _isWeekend() {
    final now = DateTime.now();
    return now.weekday == DateTime.saturday || now.weekday == DateTime.sunday;
  }

  void updateApprovalStatusForSelected() {
    setState(() {
      for (int i = 0; i < approvalStatus.length; i++) {
        if (selectedForApproval[i]) {
          approvalStatus[i] = 'approved';
        } else if (selectedForRejection[i]) {
          _showRejectionDialog(i);
        }
      }
    });
  }

  void _showRejectionDialog(int index) async {
    String rejectionDescription = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempDescription = '';
        return AlertDialog(
          title: const Text('Enter Rejection Reason'),
          content: TextField(
            onChanged: (value) {
              tempDescription = value;
            },
            decoration: const InputDecoration(hintText: "Reason for rejection"),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop('');
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop(tempDescription);
              },
            ),
          ],
        );
      },
    );

    if (rejectionDescription.isNotEmpty) {
      setState(() {
        approvalStatus[index] = 'rejected';
      });
    }
  }

  void resetStatus() {
    setState(() {
      approvalStatus = List<String>.filled(approvalStatus.length, 'pending');
      selectedForApproval = List<bool>.filled(approvalStatus.length, false);
      selectedForRejection = List<bool>.filled(approvalStatus.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morm Borenn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // Request details
            _buildRequestDetails(),
            const SizedBox(height: 15),
            // Approval title with reset button
            _buildApprovalTitle(),
            const SizedBox(height: 15),
            // Approval cards
            _buildApprovalCards(),
            const SizedBox(height: 15),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestDetails() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: requestDetails.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    '${entry.key}:',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    entry.value,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildApprovalTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Approval',
          style: TextStyle(fontSize: 17),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: resetStatus,
          tooltip: 'Reset Status',
        ),
      ],
    );
  }

  Widget _buildApprovalCards() {
    return Column(
      children: timeSlots.asMap().entries.map((entry) {
        int index = entry.key;
        if (!_isWeekend() && index >= 3) return Container();
        String slot = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ApprovalCard(
            timeSlot: slot,
            status: approvalStatus[index],
            isSelectedForApproval: selectedForApproval[index],
            isSelectedForRejection: selectedForRejection[index],
            onApprovalSelect: (bool? value) {
              setState(() {
                selectedForApproval[index] = value ?? false;
                if (value == true) {
                  selectedForRejection[index] = false;
                }
              });
            },
            onRejectionSelect: (bool? value) {
              setState(() {
                selectedForRejection[index] = value ?? false;
                if (value == true) {
                  selectedForApproval[index] = false;
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          color: Colors.green,
          onPressed: updateApprovalStatusForSelected,
          text: 'Submit',
        ),
      ],
    );
  }
}

class ApprovalCard extends StatelessWidget {
  final String timeSlot;
  final String status;
  final bool isSelectedForApproval;
  final bool isSelectedForRejection;
  final ValueChanged<bool?> onApprovalSelect;
  final ValueChanged<bool?> onRejectionSelect;

  const ApprovalCard({
    super.key,
    required this.timeSlot,
    required this.status,
    required this.isSelectedForApproval,
    required this.isSelectedForRejection,
    required this.onApprovalSelect,
    required this.onRejectionSelect,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'approved':
        statusColor = Colors.green;
        break;
      case 'rejected':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey[700]!;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              timeSlot,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              const Text('Approve'),
              Checkbox(
                value: isSelectedForApproval,
                onChanged: onApprovalSelect,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                activeColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              const Text('Reject'),
              Checkbox(
                value: isSelectedForRejection,
                onChanged: onRejectionSelect,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                activeColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
