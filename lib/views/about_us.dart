import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/nubb_logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Lab Request Management',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Lab Request Management App, an essential tool for administrators to efficiently manage and oversee lab resource requests within our institution. This app is designed to streamline the process of handling and approving requests from teachers, ensuring that lab resources are utilized effectively and according to plan.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Key Features',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const FeatureItem(
              title: 'Request Overview',
              description:
                  'Easily view and monitor all incoming lab requests from teachers, including the number of computers, projectors, and other resources required.',
            ),
            const FeatureItem(
              title: 'Approval Workflow',
              description:
                  'Quickly approve, deny, or modify requests based on availability and institutional priorities.',
            ),
            const FeatureItem(
              title: 'Real-Time Resource Tracking',
              description:
                  'Keep track of lab resource availability in real time, ensuring that no equipment is double-booked or over-allocated.',
            ),
            const FeatureItem(
              title: 'Comprehensive Reporting',
              description:
                  'Generate reports on lab usage, including details on which labs are most frequently requested and the types of resources most in demand.',
            ),
            const FeatureItem(
              title: 'User Management',
              description:
                  'Manage teacher accounts, granting or restricting access to the app as needed.',
            ),
            const SizedBox(height: 24.0),
            const Text(
              'This app empowers administrators to maintain order and efficiency in the allocation of lab resources, helping to support the smooth operation of our university\'s educational programs.',
            ),
            const SizedBox(height: 24.0),
            const Text(
              'If you have any questions or require assistance, our support team is here to help.',
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
