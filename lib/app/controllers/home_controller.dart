import 'package:flutter/widgets.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _respository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository respository])
      : _respository = respository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _respository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState {
  start,
  loading,
  success,
  error,
}
