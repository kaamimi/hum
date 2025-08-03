import 'dart:io';
import 'package:flutter/material.dart';

class TimelineImageCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TimelineImageCard({
    super.key,
    required this.imagePath,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.file(File(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
