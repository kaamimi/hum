import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewEntryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDatePicked;
  final VoidCallback onPress;

  const NewEntryAppBar({
    super.key,
    required this.selectedDate,
    required this.onDatePicked,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: TextButton.icon(
        onPressed: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) onDatePicked(picked);
        },
        icon: Icon(
          Icons.arrow_drop_down,
          size: 24,
          color: theme.colorScheme.outline,
        ),
        iconAlignment: IconAlignment.end,
        label: Text(
          DateFormat("EEE, MMM d").format(selectedDate),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        OutlinedButton.icon(
          icon: const Icon(Icons.check),
          onPressed: onPress,
          label: Text('Save'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
