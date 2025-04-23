import 'package:hive/hive.dart';
import 'package:velozity_assesment/constants/constants.dart';
import 'package:velozity_assesment/model/task.dart';

class TodoServices {
  List<Task> getTasks() {
    final task = Hive.box<Task>(Constants.taskBox).values;
    return task.toList();
  }

  void addTask(String task, {String? details}) {
    final taskBox = Hive.box<Task>(Constants.taskBox);
    final id = taskBox.values.length + 1;
    taskBox.add(Task(id: id, task, false, details: details));
  }

  Future<void> removeTask(Task task) async {
    final taskBox = Hive.box<Task>(Constants.taskBox);

    final taskToRemove =
        taskBox.values.firstWhere((element) => element.id == task.id);
    await taskToRemove.delete();
  }

  Future<void> updateTask(
    Task task,
  ) async {
    final taskBox = Hive.box<Task>(Constants.taskBox);

    final taskToEdit =
        taskBox.values.firstWhere((element) => element.id == task.id
            );
    final index = taskToEdit.key as int;
    await taskBox.put(
        index,
        Task(task.task, task.completed,
            details: task.details ?? taskToEdit.details));
  }
}
