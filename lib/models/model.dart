class RequestModel {
  final String id;
  final RequestStatus requestStatus;
  final LabStatus labStatus;
  final List<SessionStatus> sessions;  
  final String username;
  final String phone;
  final String softwareNeed;
  final String generation;
  final String major;
  final String subject;
  final String student;
  final String lab;
  final DateTime date;

  RequestModel({
    required this.id,
    required this.requestStatus,
    required this.labStatus,
    required this.sessions,
    required this.username,
    required this.phone,
    required this.softwareNeed,
    required this.generation,
    required this.major,
    required this.subject,
    required this.student,
    required this.lab,
    required this.date,
  });
}

class SessionStatus {
  final String time;
  RequestStatus status;

  SessionStatus({
    required this.time,
    required this.status,
  });
}

enum RequestStatus { pending, respond}

enum LabStatus { isAvailable, isNotAvailable, maintenance }
