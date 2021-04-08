class Habit {
  String emoji;
  String name;
  String notes;
  int streak;
  int average;
  int best;
  int numResets;
  DateTime startDate;
  DateTime lastUpdated;

  Habit({emoji, name, streak, average, best, notes, numResets, startDate, lastUpdated})
      : emoji = emoji ?? '',
        name = name ?? '',
        streak = streak ?? 0,
        average = average ?? 0,
        best = best ?? 0,
        notes = notes ?? '',
        numResets = numResets ?? 0,
        startDate = startDate ?? DateTime.now(),
        lastUpdated = startDate;

// placeholder for when setting is made
  void manuallyUpdateStreak() {
    this.streak += 1;
    this.lastUpdated = DateTime.now();
  }

  void autoUpdateStreak() {
    this.streak = DateTime.now().difference(this.startDate).inDays;
    this.lastUpdated = DateTime.now();
  }

  void updateBest() {
    this.streak >= this.best ? this.best = this.streak : this.best = this.best;
  }

  void updateAvg() {
    this.average = ((this.average + this.streak) ~/ (this.numResets + 1));
  }

// placeholder for when setting is made
  void autoResetStreak () {
    if (DateTime.now().difference(this.lastUpdated).inDays > 1) {
    this.streak = 0;
    this.startDate = DateTime.now();
    this.numResets += 1;
    this.updateAvg();
    }
  }

  void manuallyResetStreak() {
    this.streak = 0;
    this.startDate = DateTime.now();
    this.numResets += 1;
    this.updateAvg();
  }

}
