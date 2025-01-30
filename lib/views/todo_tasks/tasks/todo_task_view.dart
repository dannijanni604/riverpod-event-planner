import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_event_planner/models/todo_task.dart';
import 'package:riverpod_event_planner/utils/utils.dart';
import 'package:riverpod_event_planner/views/todo_tasks/task_provider.dart';

class TodoTaskView extends ConsumerWidget {
  const TodoTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoTask> taskList = ref.watch(taskProvider);
    print('asdfghjk');
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List")),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            String newTask = taskList.length.toString();
            ref.read(taskProvider.notifier).addTask("New $newTask");
          }),
      body: taskList.isEmpty
          ? const Center(child: Text("No Task yet"))
          : ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(taskList[index].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            ref
                                .read(taskProvider.notifier)
                                .updateTask(taskList[index].id, 'Updated');
                          },
                          icon: const Icon(
                            Icons.update,
                            color: AppTheme.kTextColor,
                          )),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(taskProvider.notifier)
                                .deleteTask(taskList[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppTheme.primaryColor,
                          )),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
