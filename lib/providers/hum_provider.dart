import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/db_helper.dart';
import '../models/entry.dart';

final humProvider = AsyncNotifierProvider<HumNotifier, List<HumEntry>>(
  HumNotifier.new,
);

class HumNotifier extends AsyncNotifier<List<HumEntry>> {
  @override
  Future<List<HumEntry>> build() async {
    return await DBHelper.getAllEntries();
  }

  Future<void> addEntry(HumEntry entry) async {
    await DBHelper.insertEntry(entry);
    state = AsyncValue.data(await DBHelper.getAllEntries());
  }

  Future<void> deleteEntry(int id) async {
    await DBHelper.deleteEntry(id);
    state = AsyncValue.data(await DBHelper.getAllEntries());
  }

  Future<void> updateEntry(HumEntry updatedEntry) async {
    await DBHelper.updateEntry(updatedEntry);
    state = AsyncValue.data(await DBHelper.getAllEntries());
  }
}
