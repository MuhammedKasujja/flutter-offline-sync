enum EntityState {
  created,
  updated,
  deleted;

  bool get isNew => this == created;
  bool get isUpdated => this == updated;
  bool get isDeleted => this == deleted;

  // what happens when an entity is created and deleted before syncing with remote server
  //
  // Do soft deletes and do permanent deleted by admin ??
}

enum SyncMode {
  all,
  single;

  bool get isAll => this == all;
  bool get isSingle => this == single;
}

enum SyncRequestUpdatesMode {
  /// No updates, [SyncClient.requestUpdates()] must be called manually.
  manual,

  /// Automatic updates, including subsequent pushes from the server, same as
  /// calling [SyncClient.requestUpdates(true)]. This is the default unless
  /// changed by [SyncClient.setRequestUpdatesMode()].
  auto,

  /// Automatic update after connection, without subscribing for pushes from the
  /// server. Similar to calling [SyncClient.requestUpdates(false)].
  autoNoPushes,
}
