class RequestModel {
  final String id;
  final String status; // 'pending', 'approved', 'rejected'
  final bool isAvailable;
  final String timeSlot;
  final String userName;
  final String lab;
  final DateTime date;

  RequestModel({
    required this.id,
    required this.status,
    required this.timeSlot,
    required this.userName,
    required this.isAvailable,
    required this.lab,
    required this.date,
  });
}
