import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/model/task.dart';
import 'package:velozity_assesment/services/todo_services.dart';
import 'package:velozity_assesment/state/todo/provider/todoServiceProvider.dart';

final taskActionsProvider = Provider<TaskActions>((ref) {
  final service = ref.watch(todoServiceProvider);
  return TaskActions(service);
});

class TaskActions {
  final TodoServices _service;
  TaskActions(this._service);

  void add(
    String task, {
    String? details,
  }) =>
      _service.addTask(task, details: details);

  Future<void> remove(Task task) => _service.removeTask(task);

  Future<void> update(
    Task task,
  ) =>
      _service.updateTask(task);
}
