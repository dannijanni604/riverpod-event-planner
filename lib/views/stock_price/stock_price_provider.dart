import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockPriceProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double price = 0.2;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));

    price += random.nextDouble() * 6 - 2;
    yield double.parse(price.toStringAsFixed(3));
  }
});
