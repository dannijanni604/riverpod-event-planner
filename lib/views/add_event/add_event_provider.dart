import 'package:flutter_riverpod/flutter_riverpod.dart';

final addEventPrvider =
    StateNotifierProvider<AddEventNotifier, Map<String, dynamic>>((ref) {
  return AddEventNotifier();
});

class AddEventNotifier extends StateNotifier<Map<String, dynamic>> {
  AddEventNotifier() : super({});

  void addEvent() {
    state = {
      'name': 'Event Name',
      'description': 'Event Description',
      'date': 'Event Date',
      'location': 'Event Location',
      'time': 'Event Time',
      'isActive': true
    };
  }
}
