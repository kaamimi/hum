import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '/core/theme.dart';

class DashedTimelineConnector extends StatelessWidget {
  const DashedTimelineConnector({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DashedLineConnector(
      color: colorScheme.outlineVariant,
      thickness: 2,
      gap: 4,
      dash: 6,
    );
  }
}

class SolidTimelineConnector extends StatelessWidget {
  const SolidTimelineConnector({super.key, required this.month});

  final int month;

  @override
  Widget build(BuildContext context) {
    return SolidLineConnector(
      color: kMonthIndicatorColors[(month - 1) % 12],
      thickness: 2,
    );
  }
}

class MonthIndicator extends StatelessWidget {
  const MonthIndicator({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          DateFormat("MMM").format(date),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class DayIndicator extends StatelessWidget {
  const DayIndicator({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Card.filled(
        color: kMonthIndicatorColors[(date.month - 1) % 12].withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            DateFormat('E').format(date),
            style: theme.textTheme.labelMedium?.copyWith(
              color: kMonthIndicatorColors[(date.month - 1) % 12],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallDotIndicator extends StatelessWidget {
  const SmallDotIndicator({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: kMonthIndicatorColors[(date.month - 1) % 12],
      size: 16,
    );
  }
}

class BigDotIndicator extends StatelessWidget {
  const BigDotIndicator({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: kMonthIndicatorColors[(date.month - 1) % 12],
      size: 36,
      child: Center(
        child: Text(
          date.day.toString(),
          style: TextStyle(
            color: kAppBarBGColor,
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
