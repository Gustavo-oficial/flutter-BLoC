import 'package:test_bloc/model/taks_model.dart';

class TaskRepository {
  final List<TaskModel> _tasks = List.empty(growable: true);

  Future<List<TaskModel>> getTasks() async{
    _tasks.addAll([
      TaskModel(name: "Fazer tal coisa 1", date: DateTime.now()),
      TaskModel(name: "Fazer tal coisa 2", date: DateTime.now()),
      TaskModel(name: "Fazer tal coisa 3", date: DateTime.now()),
      TaskModel(name: "Fazer tal coisa 4", date: DateTime.now()),
      TaskModel(name: "Fazer tal coisa 5", date: DateTime.now())
    ]);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _tasks
    );
  }

  Future<List<TaskModel>> addTask({required TaskModel task}) async{
    _tasks.add(task);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _tasks
    );
  }

  Future<List<TaskModel>> deleteTask({required TaskModel task}) async{
    _tasks.remove(task);

    return Future.delayed(
      const Duration(seconds: 1),
      () => _tasks
    );
  }
}