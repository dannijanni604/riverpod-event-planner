import 'package:flutter_riverpod/flutter_riverpod.dart';

final addEventPrvider = StateNotifierProvider<AddEventNotifier, AddEvent>(
  (ref) {
    return AddEventNotifier();
  },
);

class AddEventNotifier extends StateNotifier<AddEvent> {
  AddEventNotifier() : super(AddEvent());
  updateName(String name) {
    state = state.copyWith(name: name);
  }

  updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  updateDate(String date) {
    state = state.copyWith(date: date);
  }

  updateLocation(String location) {
    state = state.copyWith(location: location);
  }

  updateTime(String time) {
    state = state.copyWith(time: time);
  }

  updateIsActive(bool isActive) {
    state = state.copyWith(isActive: isActive);
  }
}

class AddEvent {
  final String name;
  final String description;
  final String date;
  final String location;
  final String time;
  final bool isActive;

  AddEvent({
    this.name = '',
    this.description = '',
    this.date = '',
    this.location = '',
    this.time = '',
    this.isActive = true,
  });

  AddEvent copyWith({
    String? name,
    String? description,
    String? date,
    String? location,
    String? time,
    bool? isActive,
  }) {
    return AddEvent(
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      time: time ?? this.time,
      isActive: isActive ?? this.isActive,
    );
  }
}
