import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<TodoTask>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<TodoTask>> {
  TaskNotifier() : super([]);

  addTask(String name) {
    final todoTask =
        TodoTask(id: DateTime.now().toString(), name: name, isActive: true);

    state.add(todoTask);
    state = state.toList();
  }

  updateTask(String id, String name) {
    int index = state.indexWhere((task) => task.id == id);
    state[index].name = name;
    state = state.toList();
  }

  deleteTask(String id) {
    state.removeWhere((todoTask) => todoTask.id == id);
    state = state.toList();
  }
}
