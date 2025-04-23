import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/model/task.dart';
import 'package:velozity_assesment/state/settings/provider/settings_provider.dart';
import 'package:velozity_assesment/state/todo/provider/task_action_provider.dart';
import 'package:velozity_assesment/state/todo/provider/todo_list_provider.dart';
import 'package:velozity_assesment/views/taskDetail/task_detail_view.dart';
import 'package:velozity_assesment/views/todos/components/create_todo_sheet_view.dart';

class TodosView extends ConsumerWidget {
  const TodosView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks for Today'),
        actions: [
          IconButton(
            icon: Icon(ref.watch(darkModeProvider)
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () => ref.read(darkModeProvider.notifier).toggle(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetailView(task: task)),
            ),
            title: Text(task.task),
            trailing: Checkbox(
              value: task.completed,
              onChanged: (value) async {
                await ref.read(taskActionsProvider).update(Task(
                    id: task.id,
                    task.task,
                    value ?? false,
                    details: task.details));
                ref.invalidate(taskListProvider);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateTodoSheet(
            context,
            ref,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
