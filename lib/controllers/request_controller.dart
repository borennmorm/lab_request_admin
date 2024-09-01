import 'package:get/get.dart';
import '../models/request_model.dart';

class ManageRequestController extends GetxController {
  var selectedLab = ''.obs;
  var selectedDate = DateTime.now().obs;
  var requests = <RequestModel>[].obs;

  // Observable for tracking request statistics
  var totalRequests = 0.obs;
  var pendingApprovals = 0.obs;
  var approvedRequests = 0.obs;
  var rejectedRequests = 0.obs;

  // Update selected lab
  void updateSelectedLab(String lab) {
    selectedLab.value = lab;
    fetchRequests();
  }

  // Update selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    fetchRequests();
  }

  // Fetch requests based on selected lab and date
  void fetchRequests() {
    // Replace this with your actual data fetching logic
    // This is a mock example to demonstrate the concept
    List<RequestModel> allRequests = [
      // Example requests
      RequestModel(
        id: '1',
        status: 'pending',
        timeSlot: '08:00 AM - 10:00 AM',
        userName: 'John Doe',
        lab: '010',
        isAvailable: true,
        date: DateTime.now(),
      ),
      RequestModel(
        id: '2',
        status: 'rejected',
        timeSlot: '10:00 AM - 12:00 PM',
        userName: 'Jane Smith',
        lab: '011',
        isAvailable: false,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      RequestModel(
        id: '3',
        status: 'approved',
        timeSlot: '12:00 PM - 02:00 PM',
        userName: 'Alice Johnson',
        lab: 'Programming Lab',
        isAvailable: true,
        date: DateTime.now().subtract(const Duration(days: 3)),
      ),
      // More mock data...
    ];

    // Filter requests based on selected lab and date
    List<RequestModel> filteredRequests = allRequests.where((request) {
      return request.lab == selectedLab.value &&
          request.date.year == selectedDate.value.year &&
          request.date.month == selectedDate.value.month &&
          request.date.day == selectedDate.value.day;
    }).toList();

    // Update the requests observable
    requests.value = filteredRequests;

    // Compute totals based on the recent requests
    List<RequestModel> recentRequests = getRecentRequests();
    totalRequests.value = recentRequests.length;
    pendingApprovals.value =
        recentRequests.where((r) => r.status == 'pending').length;
    approvedRequests.value =
        recentRequests.where((r) => r.status == 'approved').length;
    rejectedRequests.value =
        recentRequests.where((r) => r.status == 'rejected').length;
  }

  // Function to get total requests for the last 7 days
  List<RequestModel> getRecentRequests() {
    final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
    return requests
        .where((request) => request.date.isAfter(sevenDaysAgo))
        .toList();
  }
}
