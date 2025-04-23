import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velozity_assesment/state/settings/provider/settings_provider.dart';
import 'package:velozity_assesment/views/todos/todos_view.dart';
import 'package:velozity_assesment/utils/hive_initializer.dart';

void main() async {
  await initializeHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(darkModeProvider) ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const TodosView(),
    );
  }
}
