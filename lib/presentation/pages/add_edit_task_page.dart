import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/task_provider.dart';
import '../../data/models/task_model.dart';

class AddEditTaskPage extends StatefulWidget {
  final int? index;
  final TaskModel? task;

  const AddEditTaskPage({super.key, this.index, this.task});

  @override
  State<AddEditTaskPage> createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title);
    _descController = TextEditingController(text: widget.task?.description);
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(widget.task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = TaskModel(
                      title: _titleController.text,
                      description: _descController.text,
                      isCompleted: widget.task?.isCompleted ?? false,
                    );
                    if (widget.index == null) {
                      taskProvider.addTask(task);
                    } else {
                      taskProvider.updateTask(widget.index!, task);
                    }
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}