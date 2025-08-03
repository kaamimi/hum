import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryDateText extends StatelessWidget {
  final DateTime date;

  const EntryDateText({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      DateFormat("EEE, MMM d, yyyy").format(date),
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
