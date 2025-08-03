import 'package:flutter/material.dart';

import '/views/new_entry/new_entry_view.dart';

class TimelineFAB extends StatelessWidget {
  const TimelineFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NewEntryView()),
      ),
      label: const Text("New"),
      icon: const Icon(Icons.add),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );
  }
}
