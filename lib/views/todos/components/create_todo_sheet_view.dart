import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/state/todo/provider/task_action_provider.dart';
import 'package:velozity_assesment/state/todo/provider/todo_list_provider.dart';

void showCreateTodoSheet(BuildContext context, WidgetRef ref) {
  final taskController = TextEditingController();
  final detailController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Create Todo",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Todo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                labelText: 'Details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final task = taskController.text.trim();
                final detail = detailController.text.trim();

                if (task.isNotEmpty) {
                  final actions = ref.read(taskActionsProvider);
                  actions.add(task, details: detail); 
                  ref.invalidate(taskListProvider); 
                  Navigator.of(context).pop(); 
                }
              },
              child: const Text("Create"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
