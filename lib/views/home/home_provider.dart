import 'dart:convert';
import 'dart:io';

import 'package:riverpod/riverpod.dart';
import '../../services/data/events_data.dart';
import 'package:http/http.dart' as http;

final tabIndexProvider = StateProvider<int>((ref) => 0);

final eventsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return eventsList;
});

final serviceProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> data = jsonData.cast<Map<String, dynamic>>();
      return data;
    } else {
      throw 'Something went wrong while fetching events';
    }
  } on SocketException {
    throw 'No internet';
  } catch (e) {
    rethrow;
  }
});
