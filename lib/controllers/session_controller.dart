import 'package:get/get.dart';

class SessionController extends GetxController {
  // To store selected sessions for approval/rejection
  var selectedSessions = <String, bool>{}.obs;

  // To track the reason for approval/rejection
  var notificationMessage = ''.obs;

  // Function to toggle session selection
  void toggleSessionSelection(String session) {
    if (selectedSessions.containsKey(session)) {
      selectedSessions[session] = !selectedSessions[session]!;
    } else {
      selectedSessions[session] = true;
    }
  }

  // Reset selections
  void resetSelections() {
    selectedSessions.clear();
  }
}
