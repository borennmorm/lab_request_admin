// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../request_detail.dart';

// class ApprovalsCard extends StatefulWidget {
//   final String name;

//   const ApprovalsCard({super.key, required this.name});

//   @override
//   _ApprovalsCardState createState() => _ApprovalsCardState();
// }

// class _ApprovalsCardState extends State<ApprovalsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Ensure the name is not null and pass it to RequestDetail
//         Get.to(() => RequestDetailScreen(
//             name: widget.name.isNotEmpty ? widget.name : 'Unnamed Request'));
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.name,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const Icon(
//                 CupertinoIcons.chevron_right,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
