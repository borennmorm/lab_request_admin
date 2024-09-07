import 'package:get/get.dart';
import '../models/model.dart';

class Controller extends GetxController {
  var totalRequests = 0.obs;
  var pendingApprovals = 0.obs;
  var approvedRequests = 0.obs;
  var rejectedRequests = 0.obs;

  // Initialize the selected date and lab
  var selectedDate = Rxn<DateTime>(); // Rxn allows null values
  var selectedLab = Rxn<String>(); // Rxn allows null values

  // Dummy data
var requestData = <RequestModel>[
  RequestModel(
    id: 'REQ002',
    requestStatus: RequestStatus.respond,
    labStatus: LabStatus.isAvailable,
    sessions: [
      SessionStatus(time: '07:00 AM - 08:30 AM', status: RequestStatus.respond),
      SessionStatus(time: '10:50 AM - 12:00 PM', status: RequestStatus.pending),
      SessionStatus(time: '01:00 PM - 02:30 PM', status: RequestStatus.pending),
    ],
    username: 'Jane Smith',
    phone: '+0987654321',
    softwareNeed: 'AutoCAD',
    generation: '2023',
    major: 'Civil Engineering',
    subject: 'Structural Analysis',
    student: 'Student002',
    lab: 'Engineering Lab',
    date: DateTime(2024, 9, 5),
  ),
  RequestModel(
    id: 'REQ002',
    requestStatus: RequestStatus.pending,
    labStatus: LabStatus.isAvailable,
    sessions: [
      SessionStatus(time: '07:00 AM - 08:30 AM', status: RequestStatus.pending),
      SessionStatus(time: '10:50 AM - 12:00 PM', status: RequestStatus.pending),
      SessionStatus(time: '01:00 PM - 02:30 PM', status: RequestStatus.pending),
    ],
    username: 'Jane Smith',
    phone: '+0987654321',
    softwareNeed: 'AutoCAD',
    generation: '2023',
    major: 'Civil Engineering',
    subject: 'Structural Analysis',
    student: 'Student002',
    lab: 'Engineering Lab',
    date: DateTime(2024, 9, 6),
  ),
  RequestModel(
    id: 'REQ003',
    requestStatus: RequestStatus.pending,
    labStatus: LabStatus.isAvailable,
    sessions: [
      SessionStatus(time: '07:00 AM - 08:30 AM', status: RequestStatus.pending),
      SessionStatus(time: '10:50 AM - 12:00 PM', status: RequestStatus.respond),
      SessionStatus(time: '01:00 PM - 02:30 PM', status: RequestStatus.respond),
    ],
    username: 'John Smith',
    phone: '+0987654321',
    softwareNeed: 'AutoCAD',
    generation: '2023',
    major: 'Civil Engineering',
    subject: 'Structural Analysis',
    student: 'Student002',
    lab: 'Engineering Lab',
    date: DateTime(2024, 9, 6),
  ),
].obs;


  // Update the selected lab
  void updateSelectedLab(String lab) {
    selectedLab.value = lab;
    print("Selected Lab: $lab");
  }

  // Update selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    print("Selected Date: ${selectedDate.value}");
  }

  // Function to filter requests based on selected date and lab
  List<RequestModel> getFilteredRequests() {
    // If either selectedDate or selectedLab is not set, return an empty list
    if (selectedDate.value == null || selectedLab.value == null) {
      return [];
    }

    // Filter requests by selected date and lab
    return requestData
        .where((request) =>
            isSameDay(request.date,
                selectedDate.value!) && // Ensure selectedDate is not null
            request.lab == selectedLab.value) // Ensure selectedLab is not null
        .toList();
  }

  // Helper method to check if two dates are on the same day
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Count total requests for today
  int getTotalRequestsForToday() {
    DateTime today = DateTime.now();
    return requestData
        .where((request) => isSameDay(request.date, today))
        .length;
  }

  // Count total pending requests
  int getTotalPendingRequests() {
    return requestData
        .where((request) => request.requestStatus == RequestStatus.pending)
        .length;
  }

  // Count total approved requests for today
  int getTotalApprovedRequestsForToday() {
    DateTime today = DateTime.now();
    return requestData
        .where((request) =>
            request.requestStatus == RequestStatus.approved &&
            isSameDay(request.date, today))
        .length;
  }

  // Count total rejected requests for today
  int getTotalRejectedRequestsForToday() {
    DateTime today = DateTime.now();
    return requestData
        .where((request) =>
            request.requestStatus == RequestStatus.rejected &&
            isSameDay(request.date, today))
        .length;
  }
}
