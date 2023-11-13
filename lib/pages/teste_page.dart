import 'package:flutter/material.dart';
import 'package:test_bloc/model/taks_model.dart';

import '../blocs/task_bloc.dart';
import '../blocs/task_event.dart';

class TestePage extends StatefulWidget {
  const TestePage({
    super.key,
    required this.taskModel
  });
  final TaskModel taskModel;

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  late final TaskBloc _taskBloc;

  @override
  void initState() {
    _taskBloc = TaskBloc();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: _taskBloc.currentTasks.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_taskBloc.currentTasks[index].name!),
                IconButton(
                  onPressed: () {
                    _taskBloc.inputTask.add(DeleteTarefas(task: _taskBloc.currentTasks[index]));
                  }, 
                  icon: const Icon(
                    Icons.delete
                  )
                )
              ],
            );
          },
        ),
      ),
    );
  }
}