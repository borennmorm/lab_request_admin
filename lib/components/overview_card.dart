import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color;
  final double width; // Added width property
  final double height; // Added height property

  const OverviewCard({
    super.key,
    required this.title,
    required this.number,
    required this.color,
    this.width = 185,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: width, // Use the width property
        height: height, // Use the height property
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                number,
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
