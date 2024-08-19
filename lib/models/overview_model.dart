import 'package:flutter/material.dart';

class OverviewModel {
  Future<Map<String, int>> fetchData() async {
    // Simulate fetching data from the database
    await Future.delayed(const Duration(seconds: 2));
    
    // Example data returned from the database
    return {
      'Total Users': 1200,
      'Active Users': 900,
      'Pending Requests': 45,
      'Resolved Requests': 120,
    };
  }
}
