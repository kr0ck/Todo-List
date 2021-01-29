import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _respository;
  HomeState state = HomeState.start;

  HomeController([TodoRepository respository])
      : _respository = respository ?? TodoRepository();

  Future start() async {
    state = HomeState.loading;
    try {
      todos = await _respository.fetchTodos();
      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
  }
}

enum HomeState {
  start,
  loading,
  success,
  error,
}
