import 'package:flutter/material.dart';

import '/models/entry.dart';
import './widgets/entry_image_card.dart';
import './widgets/entry_date_text.dart';
import './widgets/entry_note_text.dart';
import './widgets/entry_mood_chip.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key, required this.entry});

  final HumEntry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Journal Entry'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EntryImageCard(imagePath: entry.imagePath),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EntryDateText(date: entry.timestamp),
                    const SizedBox(height: 12),
                    if ((entry.mood ?? '').isNotEmpty)
                      EntryMoodChip(mood: entry.mood ?? ''),
                    const SizedBox(height: 16),
                    if ((entry.note ?? '').isNotEmpty)
                      EntryNoteText(note: entry.note ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
