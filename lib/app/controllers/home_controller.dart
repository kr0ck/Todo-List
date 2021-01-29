import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final respository = TodoRepository();

  Future start() async {
    todos = await respository.fetchTodos();
  }
}
