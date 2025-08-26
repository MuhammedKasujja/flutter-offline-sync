import 'dart:convert';

import 'package:flutter_offline_sync/src/data/models/models.dart';

final class DataLoads {
  static final uploadUuid1 = 'ELDlEYx5QhXxD3ubAdSbCJQR';
  static final uploadUuid2 = 'yG1jJ4i8cbeKVvzxBvBZMZfr';
  static final uploadUuid3 = 'hGQEGGoUKZk2tmf2eLXhCquY';
  static final uploadUuid4 = 'cpSSJKMcTmD7v22KWVhZuv55';

  static final upload1 = DataEntity(
    uuid: uploadUuid1,
    data: jsonEncode({
      "age": 1004301590,
      "name": "Ms. Ashleigh Boyer I",
      "uuid": uploadUuid1,
      "email": "roberts_melyna@corwin.name",
      "phone": "(258)433-1648x56282",
      "posts": [
        {
          "uuid": "Wl9SuqSTGtYU3LCU2SzplBVw",
          "title": "Ski",
          "content": "Placerat orci nulla pellentesque dignissim enim sit.",
          "is_synced": false,
          "created_at": "2025-08-17T12:59:40.753",
          "deleted_at": null,
          "updated_at": "2025-08-17T12:59:40.753",
        },
      ],
      "is_synced": false,
      "created_at": "2025-08-18T20:30:40.753",
      "deleted_at": null,
      "updated_at": "2025-08-22T20:40:40.753",
    }),
    tableName: 'CommentModel',
    operation: 'deleted',
    entity: 'CommentModel',
  );

  static final upload2 = DataEntity(
    uuid: uploadUuid2,
    data: jsonEncode({
      "age": 1004301590,
      "name": "Ms. Ashleigh Boyer I",
      "uuid": uploadUuid2,
      "email": "roberts_melyna@corwin.name",
      "phone": "(258)433-1648x56282",
      "posts": [
        {
          "uuid": "Wl9SuqSTGtYU3LCU2SzplBVw",
          "title": "Ski",
          "content": "Placerat orci nulla pellentesque dignissim enim sit.",
          "is_synced": false,
          "created_at": "2025-08-15T15:20:40.753",
          "deleted_at": null,
          "updated_at": "2025-08-16T08:00:40.753",
        },
      ],
      "is_synced": false,
      "created_at": "2025-08-17T12:59:40.753",
      "deleted_at": null,
      "updated_at": "2025-08-17T12:59:40.753",
    }),
    tableName: 'PostModel',
    operation: 'created',
    entity: 'PostModel',
  );

  static final upload3 = DataEntity(
    uuid: uploadUuid3,
    data: jsonEncode({
      "age": 1004301590,
      "name": "Ms. Ashleigh Boyer I",
      "uuid": uploadUuid3,
      "email": "roberts_melyna@corwin.name",
      "phone": "(258)433-1648x56282",
      "posts": [
        {
          "uuid": "Wl9SuqSTGtYU3LCU2SzplBVw",
          "title": "Ski",
          "content": "Placerat orci nulla pellentesque dignissim enim sit.",
          "is_synced": false,
          "created_at": "2025-08-17T12:59:40.753",
          "deleted_at": null,
          "updated_at": "2025-08-17T12:59:40.753",
        },
      ],
      "is_synced": false,
      "created_at": "2025-08-20T12:10:40.753",
      "deleted_at": null,
      "updated_at": "2025-08-20T16:00:40.753",
    }),
    tableName: 'UserModel',
    operation: 'updated',
    entity: 'UserModel',
  );

  static final upload4 = DataEntity(
    uuid: uploadUuid4,
    data: jsonEncode({
      "age": 56,
      "name": "Ms. Ashleigh Boyer I",
      "uuid": uploadUuid4,
      "email": "roberts_melyna@corwin.name",
      "phone": "(258)433-1648x56282",
      "posts": [
        {
          "uuid": "Wl9SuqSTGtYU3LCU2SzplBVw",
          "title": "Ski",
          "content": "Placerat orci nulla pellentesque dignissim enim sit.",
          "is_synced": false,
          "created_at": "2025-08-17T12:59:40.753",
          "deleted_at": null,
          "updated_at": "2025-08-17T12:59:40.753",
        },
      ],
      "is_synced": false,
      "created_at": "2025-08-14T09:20:40.753",
      "deleted_at": null,
      "updated_at": "2025-08-20T11:45:40.753",
    }),
    tableName: 'UserModel',
    operation: 'created',
    entity: 'UserModel',
  );

  static final upload5 = DataEntity(
    uuid: uploadUuid4,
    data: jsonEncode({
      "age": 34,
      "name": "Ms. Ashleigh Boyer I",
      "uuid": uploadUuid4,
      "email": "roberts_melyna@corwin.name",
      "phone": "(258)433-1648x56282",
      "posts": [
        {
          "uuid": "Wl9SuqSTGtYU3LCU2SzplBVw",
          "title": "Ski",
          "content": "Placerat orci nulla pellentesque dignissim enim sit.",
          "is_synced": false,
          "created_at": "2025-08-17T12:59:40.753",
          "deleted_at": null,
          "updated_at": "2025-08-17T12:59:40.753",
        },
      ],
      "is_synced": false,
      "created_at": "2025-08-14T09:20:40.753",
      "deleted_at": null,
      "updated_at": "2025-08-20T10:45:40.753",
    }),
    tableName: 'UserModel',
    operation: 'updated',
    entity: 'UserModel',
  );

  static List<DataEntity> listUploads() => [
    upload1,
    upload2,
    upload3,
    upload5,
    upload4,
  ];
}
