class Habit {
  String emoji;
  String name;
  String notes;
  int streak;
  int average;
  int best;
  int numResets;
  DateTime startDate;

  Habit({emoji, this.name, streak, average, best, notes, numResets, startDate})
      : emoji = emoji ?? name[0],
        streak = streak ?? 0,
        average = average ?? 0,
        best = best ?? 0,
        notes = notes ?? '',
        numResets = numResets ?? 0,
        startDate = startDate ?? DateTime.now();
}
