import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/utils.dart';

final eventsJoined = StateProvider<List<Map<String, dynamic>>>(
  (ref) {
    return [];
  },
);

class EventDetailsView extends ConsumerWidget {
  const EventDetailsView({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text('Event Details'), actions: [
          Consumer(builder: (context, ref, child) {
            final providerEventsJoined = ref.watch(eventsJoined);
            return IconButton(
                icon: Stack(children: [
                  const Icon(Icons.event),
                  Align(
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle),
                          child: Text(providerEventsJoined.length.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppTheme.kTextColor, fontSize: 10))))
                ]),
                onPressed: () {});
          })
        ]),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Event Details',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Consumer(builder: (context, ref, child) {
                  final providerEventsJoined = ref.watch(eventsJoined);
                  final isAdded = providerEventsJoined
                      .any((element) => element['id'] == data['id']);

                  return IconButton(
                      onPressed: () {
                        ref.read(eventsJoined.notifier).update((state) {
                          if (isAdded) {
                            return state
                                .where((event) => event['id'] != data['id'])
                                .toList();
                          } else {
                            return [...state, data];
                          }
                        });
                      },
                      icon: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(isAdded ? "Remove -" : "Add +"))));
                })
              ]),
              Text('Name: ${data['name']}'),
              Text('Description: ${data['description']}'),
              Text('Location: ${data['location']}'),
              Text('Date: ${data['date']}'),
              Text('Time: ${data['time']}')
            ])));
  }
}
