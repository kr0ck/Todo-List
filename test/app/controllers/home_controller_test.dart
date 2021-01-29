import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/app/controllers/home_controller.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test(
    'deve preecher variavel todos',
    () async {
      when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

      await controller.start();
      expect(controller.todos.isNotEmpty, true);
    },
  );
}
