import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/constants.dart';
import '/models/entry.dart';
import '../../data/image_handler.dart';
import '/providers/hum_provider.dart';

import './widgets/ne_appbar.dart';
import './widgets/ne_image_picker.dart';
import './widgets/ne_fab.dart';
import './widgets/ne_note_text_field.dart';
import './widgets/ne_mood_selector.dart';

class NewEntryView extends ConsumerStatefulWidget {
  const NewEntryView({super.key});

  @override
  ConsumerState<NewEntryView> createState() => _NewEntryViewState();
}

class _NewEntryViewState extends ConsumerState<NewEntryView> {
  DateTime _selectedDate = DateTime.now();
  File? _imageFile;
  final TextEditingController _textController = TextEditingController();
  String? _selectedMood;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final saved = await ImageHandler.takePhoto();
    if (saved != null) {
      setState(() => _imageFile = saved);
    }
  }

  Future<void> _pickFromGallery() async {
    final picked = await ImageHandler.pickFromGallery();
    if (picked != null) {
      setState(() => _imageFile = picked);
    }
  }

  Future<void> _changeImageSource() async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text("Take a photo"),
            onTap: () {
              Navigator.pop(context);
              _takePhoto();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text("Pick from gallery"),
            onTap: () {
              Navigator.pop(context);
              _pickFromGallery();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _saveEntry() async {
    if (_imageFile == null) return;

    final entry = HumEntry(
      imagePath: _imageFile!.path,
      timestamp: _selectedDate,
      note: _textController.text,
      mood: _selectedMood,
    );

    await ref.read(humProvider.notifier).addEntry(entry);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: NewEntryAppBar(
        selectedDate: _selectedDate,
        onDatePicked: (date) => setState(() => _selectedDate = date),
        onPress: () => _saveEntry(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isKeyboardOpen
          ? null
          : NewEntryFAB(
              imageFile: _imageFile,
              onTakePhoto: _takePhoto,
              onSave: _saveEntry,
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              NewEntryImagePicker(
                imageFile: _imageFile,
                onPickImage: _pickFromGallery,
                onChangeImage: _changeImageSource,
              ),
              AppGaps.v16,
              NewEntryNoteTextField(controller: _textController),
              AppGaps.v16,
              NewEntryMoodSelector(
                selectedMood: _selectedMood,
                onMoodSelected: (mood) => setState(() => _selectedMood = mood),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
