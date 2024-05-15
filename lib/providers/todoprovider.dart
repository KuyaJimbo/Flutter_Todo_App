// define the todo provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';

/* 
Blueprint for creating a StateNotifierProvider and its corresponding StateNotifier class

final PROVIDER_NAME = StateNotifierProvider<NOTIFIER_CLASS, STATE_CLASS>((ref) {
  return NOTIFIER_CLASS();
});

class NOTIFIER_CLASS extends StateNotifier<STATE_CLASS> {
  NOTIFIER_CLASS(): super(INITIAL_STATE);
}
*/

// Define the provider as a StateNotifierProvider
// This provider will be used to manage the state of the TodoListNotifier
final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  // Define a method to add a new Todo to the list
  void addTodo(String content) {
    state = [
      ...state,
      Todo(
        id: state.isEmpty ? 0 : state[state.length - 1].id + 1,
        content: content,
        completed: false,
      ),
    ];
  }

  // Define a method to toggle the completed status of a Todo
  void toggleCompleteTodo(String content) {
    state = [
      for (final todo in state)
        if (todo.content == content)
          Todo(
            id: todo.id,
            content: todo.content,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  // Define a method to remove a Todo from the list
  void removeTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  // Define a method to clear all completed Todos from the list
  void clearCompletedTodos() {
    state = state.where((todo) => !todo.completed).toList();
  }

  // Define a method to clear all Todos from the list
  void clearAllTodos() {
    state = [];
  }
}
