import 'dart:async';

import 'package:test_bloc/blocs/task_event.dart';
import 'package:test_bloc/blocs/task_state.dart';
import 'package:test_bloc/repositories/task_repository.dart';

import '../model/taks_model.dart';

class TaskBloc {
  final _repository = TaskRepository();

  final StreamController<TaskEvent> _inputTaskController = StreamController<TaskEvent>();

  final StreamController<TaskState> _outputTaskController = StreamController<TaskState>();

  Sink<TaskEvent> get inputTask => _inputTaskController.sink;

  Stream<TaskState> get outputTask => _outputTaskController.stream;

  List<TaskModel> currentTasks = List.empty(growable: true);

  TaskBloc(){
    _inputTaskController.stream.listen(_mapEventToState);
  }

  void _mapEventToState (TaskEvent event) async{
    _outputTaskController.add(TaskLoadingState());

    if(event is GetTarefas){
      currentTasks = await _repository.getTasks();
    }else if(event is AddTarefas){
      currentTasks = await _repository.addTask(task: event.task);
    }else if(event is DeleteTarefas){
      currentTasks = await _repository.deleteTask(task: event.task);
    }

    _outputTaskController.add(TaskLoadedState(tasks: currentTasks));
  }
}