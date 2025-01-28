import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalUsers = Provider<int>((ref) {
  return 0;
});

final eventsList = Provider<List<Map<String, dynamic>>>((ref) {
  final List<Map<String, dynamic>> events = [
    {
      'name': 'Event 1',
      'date': '2021-10-10',
      'time': '10:00',
      'location': 'Location 1',
      'description': 'Description 1',
    },
    {
      'name': 'Event 2',
      'date': '2021-10-11',
      'time': '11:00',
      'location': 'Location 2',
      'description': 'Description 2',
    },
    {
      'name': 'Event 3',
      'date': '2021-10-12',
      'time': '12:00',
      'location': 'Location 3',
      'description': 'Description 3',
    },
  ];
  return events;
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.read(eventsList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Planner'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: prov.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              Text(prov[index]['name']),
            ],
          ),
        ),
      ),
    );
  }
}
