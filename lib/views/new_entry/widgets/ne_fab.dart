import 'dart:io';
import 'package:flutter/material.dart';

class NewEntryFAB extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTakePhoto;
  final VoidCallback onSave;

  const NewEntryFAB({
    super.key,
    required this.imageFile,
    required this.onTakePhoto,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool hasImage = imageFile != null;

    return FloatingActionButton.extended(
      onPressed: hasImage ? onSave : onTakePhoto,
      label: Text(hasImage ? 'Next' : 'Camera'),
      icon: Icon(hasImage ? Icons.arrow_forward : Icons.camera_alt_outlined),
      backgroundColor: hasImage
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.primary,
      foregroundColor: hasImage
          ? theme.colorScheme.onPrimaryContainer
          : theme.colorScheme.onPrimary,
    );
  }
}
