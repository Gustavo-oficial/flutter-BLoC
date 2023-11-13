import 'package:flutter/material.dart';
import 'package:test_bloc/blocs/task_bloc.dart';
import 'package:test_bloc/blocs/task_event.dart';
import 'package:test_bloc/blocs/task_state.dart';
import 'package:test_bloc/model/taks_model.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskBloc _taskBloc;

  @override
  void initState() {
    _taskBloc = TaskBloc();
    _taskBloc.inputTask.add(GetTarefas());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter BLoC",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black
      ),
      body: StreamBuilder<TaskState>(
        stream: _taskBloc.outputTask,
        builder: (context, state) {
          final list = state.data?.tasks ?? [];

          if(state.data is TaskLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black26,
                color: Colors.blue,
              ),
            );
          }else if(state.data is TaskLoadedState){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(list[index].name!),
                      IconButton(
                        onPressed: () {
                          _taskBloc.inputTask.add(DeleteTarefas(task: list[index]));
                        }, 
                        icon: const Icon(
                          Icons.delete
                        )
                      )
                    ],
                  );
                },
              ),
            );  
          }else{
            return const Text("ERRO");
          }
        },
      ),
      floatingActionButton: MaterialButton(
        onPressed: () => Navigator.pushNamed(context, "/testePage", arguments: {"task": TaskModel(name: "nova task", date: DateTime.now())}),
        color: Colors.black,
        child: const Text(
          "Próximo",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}