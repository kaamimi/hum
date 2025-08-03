import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '/data/image_handler.dart';
import '/providers/hum_provider.dart';
import '/views/entry_view/entry_view.dart';
import '/core/constants.dart';

import './widgets/tl_image_card.dart';
import './widgets/tl_appbar.dart';
import './widgets/tl_elements.dart';
import './widgets/tl_fab.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TimelineAppBar(
        month: DateTime.now().month,
        scrollController: _scrollController,
      ),
      floatingActionButton: const TimelineFAB(),
      body: HumTimeline(scrollController: _scrollController),
    );
  }
}

class HumTimeline extends ConsumerWidget {
  const HumTimeline({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(humProvider);

    return entriesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (entries) {
        if (entries.isEmpty) {
          return const Center(child: Text('No entries yet 😢'));
        }

        return Timeline.tileBuilder(
          controller: scrollController,
          theme: TimelineThemeData(nodePosition: 0),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: entries.length,
            connectorBuilder: (context, index, type) {
              final currentMonth = entries[index].timestamp.month;
              final previousMonth = entries[index - 1].timestamp.month;
              final bool isMonthChange = previousMonth != currentMonth;

              if (index == 0) {
                return SolidTimelineConnector(month: currentMonth);
              }
              return isMonthChange
                  ? const DashedTimelineConnector()
                  : SolidTimelineConnector(month: currentMonth);
            },
            indicatorBuilder: (context, index) {
              final currentDate = entries[index].timestamp;
              final bool showMonth =
                  index == 0 ||
                  entries[index - 1].timestamp.month != currentDate.month;
              final bool showDay =
                  index == 0 ||
                  entries[index - 1].timestamp.day != currentDate.day ||
                  entries[index - 1].timestamp.month != currentDate.month;

              final bool showBigDot = showMonth || showDay;

              return SizedBox(
                width: 60,
                child: Column(
                  children: [
                    if (showMonth) MonthIndicator(date: currentDate),
                    if (showDay) DayIndicator(date: currentDate),
                    if (showBigDot)
                      BigDotIndicator(date: currentDate)
                    else
                      SmallDotIndicator(date: currentDate),
                  ],
                ),
              );
            },
            contentsBuilder: (context, index) {
              final entry = entries[index];

              return Padding(
                padding: AppPadding.all8,
                child: TimelineImageCard(
                  imagePath: entry.imagePath,
                  onLongPress: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete entry?'),
                        content: const Text(
                          'Are you sure you want to delete this entry?',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    );

                    if (confirmed ?? false) {
                      ref.read(humProvider.notifier).deleteEntry(entry.id!);
                      ImageHandler.deleteImage(File(entry.imagePath));
                    }
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EntryView(entry: entry),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
