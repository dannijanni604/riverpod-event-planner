import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/utils.dart';
import 'add_event_provider.dart';

class AddEventView extends ConsumerWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Adnan");
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextfield((value) {
              ref.read(addEventPrvider.notifier).updateName(value);
            }, 'Name'),
            customTextfield((value) {
              ref.read(addEventPrvider.notifier).updateDescription(value);
            }, 'Description'),
            customTextfield((value) {
              ref.read(addEventPrvider.notifier).updateLocation(value);
            }, 'Location'),
            customTextfield((value) {
              ref.read(addEventPrvider.notifier).updateTime(value);
            }, 'Time'),
            customTextfield((value) {
              ref.read(addEventPrvider.notifier).updateDate(value);
            }, 'Date'),
            Row(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final isActiveProvider = ref.watch(
                        (addEventPrvider).select((value) => value.isActive));
                    return Checkbox(
                      value: isActiveProvider,
                      onChanged: (value) {
                        ref
                            .read(addEventPrvider.notifier)
                            .updateIsActive(value!);
                      },
                    );
                  },
                ),
                const Text('Active',
                    style: TextStyle(color: AppTheme.kTextColor)),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Add',
                    style: TextStyle(color: AppTheme.kTextColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
