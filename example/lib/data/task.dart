import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({required String id}) = _Task;

  factory Task.fromJson(json) => _$TaskFromJson(json);
}
