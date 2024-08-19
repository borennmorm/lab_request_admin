import 'package:flutter/material.dart';

class CheckAvailability extends StatelessWidget {
  const CheckAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Availability'),
      ),
      body: const Center(
        child: Text('Check Availability'),
      ),
    );
  }
}
