import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/model/task.dart';
import 'package:velozity_assesment/state/todo/provider/todoServiceProvider.dart';

final taskListProvider = Provider<List<Task>>((ref,
//  username

 ) {
  final service = ref.watch(todoServiceProvider);
  return service.getTasks();
});
