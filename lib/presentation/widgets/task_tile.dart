import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/task_provider.dart';
import '../../data/models/task_model.dart';
import '../pages/add_edit_task_page.dart';

class TaskTile extends StatelessWidget {
  final int index;
  const TaskTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => taskProvider.toggleComplete(index),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(task.description ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEditTaskPage(index: index, task: task),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => taskProvider.deleteTask(index),
          )
        ],
      ),
    );
  }
}