import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_event_planner/views/stock_price/stock_price_provider.dart';

class StockPriceView extends ConsumerWidget {
  const StockPriceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Building');
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Price')),
      body: Consumer(
        builder: (context, ref, child) {
          final stockProvider = ref.watch(stockPriceProvider);
          print('Building 2');

          return stockProvider.when(
              data: (data) => Center(child: Text(data.toString())),
              error: (error, stackTrace) =>
                  Center(child: Text("Error occurs: $error")),
              loading: () => const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
