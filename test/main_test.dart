import 'package:flutter_offline_sync/src/data/services/data/remote_changes_service.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:test/test.dart';

import 'mock/data_loads.dart';

void main() {
  setUp(() {});

  tearDown(() {});

  test('Data updates sorting order', () async {
    final uploads = DataLoads.listUploads();

    final sortedList = await sortInBackground(uploads);

    expect(sortedList.first.uuid, DataLoads.uploadUuid2);

    for (var data in sortedList) {
      logger.info({
        'updatedAt': data.updatedAt?.toIso8601String(),
        'uuid': data.uuid,
      });
    }
  });
}
