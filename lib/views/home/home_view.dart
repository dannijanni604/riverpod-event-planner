import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_event_planner/data/events_data.dart';
import 'package:riverpod_event_planner/views/todo_tasks/tasks/todo_task_view.dart';
import '../../utils/utils.dart';
import '../views.dart';

final eventsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return eventsList;
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.read(eventsProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Event Planner'), actions: [
          IconButton(
              icon: const Icon(Icons.toll_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TodoTaskView();
                }));
              }),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddEventView();
                }));
              })
        ]),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
                itemCount: prov.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EventDetailsView(data: prov[index]);
                      }));
                    },
                    child: Stack(children: [
                      Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(prov[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(prov[index]['date'],
                                              overflow: TextOverflow.ellipsis)
                                        ]),
                                    Text(prov[index]['description']),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Time:${prov[index]['time']}'),
                                          Text(prov[index]['location'])
                                        ])
                                  ]))),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 15,
                              decoration: BoxDecoration(
                                  color: prov[index]['isActive']
                                      ? Colors.green
                                      : AppTheme.primaryColor,
                                  shape: BoxShape.circle),
                              height: 15))
                    ])))));
  }
}
