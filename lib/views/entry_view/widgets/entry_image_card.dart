import 'dart:io';
import 'package:flutter/material.dart';

class EntryImageCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const EntryImageCard({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(File(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
