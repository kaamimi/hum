import 'package:flutter/material.dart';

const List<String> moodOptions = [
  '😄 Happy',
  '😌 Chill',
  '🤩 Excited',
  '🥰 Lovely',
  '😐 Neutral',
  '😴 Tired',
  '😢 Sad',
  '😰 Anxious',
  '😡 Angry',
];

class NewEntryMoodSelector extends StatefulWidget {
  final String? selectedMood;
  final ValueChanged<String?> onMoodSelected;

  const NewEntryMoodSelector({
    super.key,
    required this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  State<NewEntryMoodSelector> createState() => _NewEntryMoodSelectorState();
}

class _NewEntryMoodSelectorState extends State<NewEntryMoodSelector> {
  final ScrollController _scrollController = ScrollController();
  bool _showLeftFade = false;
  bool _showRightFade = false;

  void _updateFade() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.offset;

    setState(() {
      _showLeftFade = current > 0;
      _showRightFade = current < maxScroll;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateFade);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) _updateFade();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateFade);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 24),
            itemCount: moodOptions.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final mood = moodOptions[index];
              final isSelected = mood == widget.selectedMood;

              return ChoiceChip(
                label: Text(mood),
                selected: isSelected,
                onSelected: (_) =>
                    widget.onMoodSelected(isSelected ? null : mood),
                selectedColor: theme.colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
              );
            },
          ),

          if (_showLeftFade)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  width: 16,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        theme.colorScheme.surface,
                        theme.colorScheme.surface.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          if (_showRightFade)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  width: 24,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        theme.colorScheme.surface,
                        theme.colorScheme.surface.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
