import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/utils.dart';
import '../todo_tasks/tasks/todo_task_view.dart';
import '../views.dart';
import 'home_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    return DefaultTabController(
        initialIndex: tabIndex,
        length: 2,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StockPriceView()));
                },
                child: const Icon(Icons.auto_graph)),
            appBar: AppBar(
                bottom: const TabBar(tabs: [
                  Tab(icon: Icon(Icons.event_seat_outlined), text: "Events"),
                  Tab(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      text: "Discover")
                ]),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.toll_outlined),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TodoTaskView();
                        }));
                      }),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AddEventView();
                        }));
                      })
                ]),
            body: TabBarView(children: [
              dataEventsView(ref),
              apiEventsView(ref),
            ])));
  }
}

Widget dataEventsView(WidgetRef ref) {
  final prov = ref.watch(eventsProvider);
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ListView.builder(
          itemCount: prov.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventDetailsView(data: prov[index]);
                }));
              },
              child: Stack(children: [
                Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
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
              ]))));
}

Widget apiEventsView(WidgetRef ref) {
  final prov = ref.watch(serviceProvider);
  return prov.when(
    data: (data) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Stack(children: [
                    Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            data[index]['date'] ??
                                                '10 Feb 2002',
                                            overflow: TextOverflow.ellipsis)
                                      ]),
                                  Text(data[index]['body']),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Time:${data[index]['time'] ?? '10:10 AM'}'),
                                        Text(data[index]['location'] ??
                                            'New York Business Hub')
                                      ])
                                ]))),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 15,
                            decoration: BoxDecoration(
                                color: (data[index]['isActive'] != null &&
                                        data[index]['isActive'])
                                    ? Colors.green
                                    : AppTheme.primaryColor,
                                shape: BoxShape.circle),
                            height: 15))
                  ])));
    },
    error: (error, stackTrace) => Center(child: Text(error.toString())),
    loading: () => const Center(child: CircularProgressIndicator()),
  );
}
