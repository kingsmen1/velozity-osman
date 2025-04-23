import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  @HiveField(0)
  final String task;
  @HiveField(1)
  final bool completed;
  @HiveField(2)
  final String? details;
  @HiveField(3)
  final int? id;

  Task(
      this.task,
      this.completed,
      {this.details,
      this.id,});
}
