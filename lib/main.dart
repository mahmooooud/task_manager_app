import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/hive_boxes.dart';
import 'data/models/task_model.dart';
import 'domain/providers/task_provider.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(taskBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..loadTasks(),
      child: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) => MaterialApp(
          title: 'Task Manager',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: taskProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
