import 'package:hive_flutter/hive_flutter.dart';
import 'package:velozity_assesment/constants/constants.dart';
import 'package:velozity_assesment/model/task.dart';

initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox<Task>(Constants.taskBox);
  await Hive.openBox<bool>(Constants.settings);
}
