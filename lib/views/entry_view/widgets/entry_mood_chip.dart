import 'package:flutter/material.dart';

class EntryMoodChip extends StatelessWidget {
  final String mood;

  const EntryMoodChip({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    final emoji = _moodToEmoji(mood);
    final theme = Theme.of(context);

    return Chip(
      label: Text(
        emoji.isNotEmpty ? '$emoji  $mood' : mood,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  String _moodToEmoji(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return '😄';
      case 'chill':
        return '😌';
      case 'excited':
        return '🤩';
      case 'lovely':
        return '🥰';
      case 'neutral':
        return '😐';
      case 'sad':
        return '😢';
      case 'tired':
        return '😴';
      case 'anxious':
        return '😰';
      case 'angry':
        return '😡';
      default:
        return '';
    }
  }
}
