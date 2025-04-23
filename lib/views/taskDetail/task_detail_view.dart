import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/model/task.dart';
import 'package:velozity_assesment/state/todo/provider/task_action_provider.dart';
import 'package:velozity_assesment/state/todo/provider/todo_list_provider.dart';

class TaskDetailView extends ConsumerStatefulWidget {
  final Task task;

  const TaskDetailView({super.key, required this.task});

  @override
  ConsumerState<TaskDetailView> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends ConsumerState<TaskDetailView> {
  late TextEditingController titleController;
  late TextEditingController detailController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.task.trim());
    detailController = TextEditingController(text: widget.task.details?.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () async {
              final actions = ref.read(taskActionsProvider);
              await actions.remove(widget.task);
              ref.invalidate(taskListProvider);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
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
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedTitle = titleController.text.trim();
                final updatedTaskDetails = detailController.text.trim();
                final actions = ref.read(taskActionsProvider);
                final updatedTask = Task(
                  id: widget.task.id,
                  updatedTitle,
                  details: updatedTaskDetails,
                  widget.task.completed,
                );

                await actions.update(updatedTask);

                ref.invalidate(taskListProvider);
                Navigator.pop(context);
              },
              child: const Text("Save Changes"),
            )
          ],
        ),
      ),
    );
  }
}
