import 'package:flutter/material.dart';

class LabSessionCard extends StatelessWidget {
  final Color backgroundColor;
  final Color lineBarColor;
  final String labNumber;
  final String labTitle;
  final String sessionText;

  const LabSessionCard(
      {super.key,
      required this.backgroundColor,
      required this.lineBarColor,
      required this.labNumber,
      required this.labTitle,
      required this.sessionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // Left Section: Number
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              labNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          // Right Section: Labs Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labTitle,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Stack(
                  children: [
                    Container(
                      height: 8.0,
                      width: double.infinity,
                      color: lineBarColor,
                    ),
                    Container(
                      height: 8.0,
                      width: MediaQuery.of(context).size.width *
                          0.4, // 40% completion
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Session',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      sessionText,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
