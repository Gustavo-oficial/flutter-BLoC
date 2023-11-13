import '../model/taks_model.dart';

abstract class TaskEvent {
  
}

class GetTarefas extends TaskEvent {}

class AddTarefas extends TaskEvent {
  final TaskModel task;

  AddTarefas({required this.task});
}

class DeleteTarefas extends TaskEvent {
  final TaskModel task;

  DeleteTarefas({required this.task});
}