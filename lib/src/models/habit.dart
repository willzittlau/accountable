class Habit {
  String emoji;
  String name;
  String notes;
  int streak;
  double average;
  int best;
  int numResets;
  int totalDays;
  DateTime startDate;
  DateTime lastUpdated;

  Habit({emoji, name, streak, average, best, notes, numResets, totalDays, startDate, lastUpdated})
      : emoji = emoji ?? '',
        name = name ?? '',
        streak = streak ?? 0,
        average = average ?? 0.0,
        best = best ?? 0,
        notes = notes ?? '',
        numResets = numResets ?? 0,
        totalDays = totalDays ?? 0,
        startDate = startDate ?? DateTime.now().toUtc(),
        lastUpdated = lastUpdated ?? DateTime.now().toUtc();

  Map<String, dynamic> toJson() {
    return 
      {'emoji': emoji,
      'name': name,
      'notes' : notes,
      'streak' : streak,
      'average' : average,
      'best' : best,
      'numResets' : numResets,
      'totalDays' : totalDays,
      'startDate' : startDate.toIso8601String(),
      'lastUpdated' : lastUpdated.toIso8601String()
      };
  }

// placeholder for when setting is made
  void manuallyUpdateStreak() {
    this.streak += 1;
    this.lastUpdated = DateTime.now().toUtc();
  }

  void autoUpdateStreak() {
    this.streak = DateTime.now().toUtc().difference(this.startDate).inDays;
    this.lastUpdated = DateTime.now().toUtc();
  }

  void updateBest() {
    if (this.streak >= this.best) this.best = this.streak;
  }

  void updateAvg() {
    this.streak == 0 ? 
    this.average = (this.totalDays / this.numResets) :
    this.average = ((this.totalDays + this.streak) / (this.numResets + 1));
  }

// placeholder for when setting is made
  void autoResetStreak () {
    if (DateTime.now().toUtc().difference(this.lastUpdated).inDays > 1) {
    this.totalDays += this.streak;
    this.streak = 0;
    this.startDate = DateTime.now().toUtc();
    this.numResets += 1;
    this.updateAvg();
    }
  }

  void manuallyResetStreak() {
    this.totalDays += this.streak;
    this.streak = 0;
    this.startDate = DateTime.now().toUtc();
    this.numResets += 1;
    this.updateAvg();
  }
}
