import 'package:test_bloc/model/taks_model.dart';

abstract class TaskState {
  final List<TaskModel> tasks;

  TaskState({required this.tasks});
}

class TaskInitialState extends TaskState{
  TaskInitialState() : super(tasks: []);
}

class TaskLoadingState extends TaskState{
  TaskLoadingState() : super(tasks: []);
}

class TaskLoadedState extends TaskState{
  TaskLoadedState({required List<TaskModel> tasks}) : super(tasks: tasks);
}

class TaskErrorState extends TaskState{
  final Exception exception;

  TaskErrorState({required this.exception}) : super(tasks: []);
}