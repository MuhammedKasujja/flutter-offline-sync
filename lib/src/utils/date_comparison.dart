import 'package:flutter_offline_sync/src/data/enums/enums.dart';
export 'package:flutter_offline_sync/src/data/enums/enums.dart'
    show EntityState;

bool _isSameDate(DateTime? a, DateTime? b) {
  if (a == null || b == null) return false;
  return a.year == b.year &&
      a.month == b.month &&
      a.day == b.day &&
      a.hour == b.hour &&
      a.minute == b.minute &&
      a.second == b.second;
}

bool _isDateAfter(DateTime? a, DateTime? b) {
  if (a == null || b == null) return false;
  return a.isAfter(b);
}

bool _isDateBefore(DateTime? a, DateTime? b) {
  if (a == null || b == null) return false;
  return a.isBefore(b);
}

/// `this` refers to the `createdAt`, other => `updatedAt`
extension DateTimeComparison on DateTime? {
  bool isSameDate(DateTime? other) => _isSameDate(this, other);
  bool isAfter(DateTime? other) => _isDateAfter(this, other);
  bool isBefore(DateTime? other) => _isDateBefore(this, other);

  EntityState syncState(DateTime? other) {
    if (this == null && other == null) return EntityState.deleted;
    if (this == null) return EntityState.deleted;
    if (other == null) return EntityState.deleted;

    if (_isSameDate(this, other)) {
      return EntityState.created;
    } else if (isBefore(other)) {
      return EntityState.updated;
    } else {
      return EntityState.deleted;
    }
  }
}
