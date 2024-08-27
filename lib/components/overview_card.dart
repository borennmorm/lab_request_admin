import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color;
  final Callback onTap;

  const OverviewCard({
    super.key,
    required this.title,
    required this.number,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the width of the card based on the screen size
    double cardWidth = MediaQuery.of(context).size.width / 2.5;
    double cardHeight = MediaQuery.of(context).size.height / 8;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Padding(
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
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: Text(
                    number,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
