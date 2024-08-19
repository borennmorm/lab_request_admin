import 'package:flutter/material.dart';

class ApprovalCard extends StatefulWidget {
  final String timeSlot;

  const ApprovalCard({super.key, required this.timeSlot});

  @override
  State<ApprovalCard> createState() => _ApprovalCardState();
}

class _ApprovalCardState extends State<ApprovalCard> {
  Color _cardColor = Colors.white;
  String _status = 'Pending';
  Color _borderColor = Colors.black;
  bool _isChecked = false;

  void _approve() {
    setState(() {
      _cardColor = Colors.green.shade50;
      _status = 'Approve';
      _borderColor = Colors.green;
      _isChecked = true; // Show the check icon
    });
  }

  void _reject() {
    setState(() {
      _cardColor = Colors.red.shade50;
      _status = 'Rejected';
      _borderColor = Colors.red;
      _isChecked = true; // Show the check icon
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: _borderColor),
          ),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.8,
                child: Checkbox(
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue!;
                      if (_isChecked) {
                        // Automatically approve when checked
                        _approve();
                      } else {
                        // Reset to default if unchecked
                        _cardColor = Colors.white;
                        _status = 'Pending';
                        _borderColor = Colors.black;
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  activeColor: _borderColor,
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.timeSlot,
                    style: TextStyle(
                      color: _borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    _status,
                    style: TextStyle(
                      color: _borderColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _approve,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Approve'),
            ),
            const SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: _reject,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Reject'),
            ),
          ],
        ),
      ],
    );
  }
}
