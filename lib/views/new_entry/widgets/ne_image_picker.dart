import 'dart:io';
import 'package:flutter/material.dart';

import '/core/constants.dart';

class NewEntryImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPickImage;
  final VoidCallback onChangeImage;

  const NewEntryImagePicker({
    super.key,
    required this.imageFile,
    required this.onPickImage,
    required this.onChangeImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: imageFile == null ? onPickImage : null,
        onLongPress: imageFile != null ? onChangeImage : null,
        child: Container(
          height: 300,
          alignment: Alignment.center,
          child: imageFile != null
              ? Image.file(
                  imageFile!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.photo_library_outlined, size: 48),
                    AppGaps.v8,
                    Text(
                      'Pick an image',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Long-press to change image',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
