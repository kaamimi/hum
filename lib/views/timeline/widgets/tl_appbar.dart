import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/core/theme.dart';

class TimelineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TimelineAppBar({
    super.key,
    required this.month,
    required this.scrollController,
  });

  final int month;
  final ScrollController scrollController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        "Hum",
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Card(
              clipBehavior: Clip.hardEdge,
              color: kMonthIndicatorColors[(month - 1) % 12],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    DateFormat("EEE, MMM d").format(DateTime.now()),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: kAppBarBGColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
