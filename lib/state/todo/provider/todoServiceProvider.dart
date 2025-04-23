import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/services/todo_services.dart';

final todoServiceProvider = Provider<TodoServices>((ref)  {
  final service = TodoServices();
  return service;
});
