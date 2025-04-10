import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/presentation/widgets/custom_text_form_field.dart';
import '../../domain/providers/task_provider.dart';
import '../pages/add_edit_task_page.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
            child: CustomTextFormField(
              hint: 'Search tasks...',
              onSave: (text) {  },
              filledColor: Theme.of(context).colorScheme.background,
              inputType: TextInputType.text,
              label: 'Search',
              onChange: (text){
                taskProvider.setSearchQuery(text ?? "");
              },
            )
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(taskProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => taskProvider.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditTaskPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}