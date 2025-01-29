import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/utils.dart';
import 'add_event_provider.dart';

class AddEventView extends ConsumerWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addEvent = ref.watch(addEventPrvider);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    bool isActive = false;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextfield(nameController, 'Name'),
            customTextfield(descriptionController, 'Description'),
            customTextfield(locationController, 'Location'),
            customTextfield(timeController, 'Time'),
            customTextfield(dateController, 'Date'),
            Row(
              children: [
                Checkbox(
                  value: isActive,
                  onChanged: (value) {},
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
