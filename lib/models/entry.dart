class HumEntry {
  final int? id;
  final String imagePath;
  final DateTime timestamp;
  final String? note;
  final String? mood;

  HumEntry({
    this.id,
    required this.imagePath,
    required this.timestamp,
    this.note,
    this.mood,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'date': timestamp.toIso8601String(),
      'note': note,
      'mood': mood,
    };
  }

  factory HumEntry.fromMap(Map<String, dynamic> map) {
    return HumEntry(
      id: map['id'],
      imagePath: map['imagePath'],
      timestamp: DateTime.parse(map['date']),
      note: map['note'],
      mood: map['mood'],
    );
  }

  @override
  String toString() {
    return 'HumEntry(id: $id, imagePath: $imagePath, date: $timestamp, note: $note, mood: $mood)';
  }
}
