import 'package:flutter/material.dart';

class EntryNoteText extends StatelessWidget {
  final String note;

  const EntryNoteText({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(note, style: theme.textTheme.bodyLarge?.copyWith(height: 1.5));
  }
}
