import 'package:flutter/material.dart';

import '../components/approval_card.dart';

class RequestDetail extends StatelessWidget {
  const RequestDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Morm Borenn'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // request lab
                          Text(
                            'Request Lab:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),
                          // request date
                          Text(
                            'Request Date:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // phone number
                          Text(
                            'Phone Number:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // major
                          Text(
                            'Major:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // subject
                          Text(
                            'Subject:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // software use
                          Text(
                            'Software Use:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // student quantity
                          Text(
                            'Student Quantity:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // sessions
                          Text(
                            'Sessions:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // additional
                          Text(
                            'Additional:',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // request lab
                          Text(
                            '013',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),
                          // request date
                          Text(
                            'Mon, 19 Aug 2024',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // phone number
                          Text(
                            '0912747332',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // major
                          Text(
                            'Accounting',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // subject
                          Text(
                            'Computer Practice',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // software use
                          Text(
                            'Ms Excel',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // student quantity
                          Text(
                            '>50',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // sessions
                          Text(
                            'Sessions:',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          // additional
                          Text(
                            'I want ...',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Approval
              const SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Approval',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ApprovalCard(timeSlot: '07:00 - 08:30 AM'),
            ],
          ),
        ));
  }
}
