import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _respository;

  HomeController([TodoRepository respository])
      : _respository = respository ?? TodoRepository();

  Future start() async {
    todos = await _respository.fetchTodos();
  }
}
