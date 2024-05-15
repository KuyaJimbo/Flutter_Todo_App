/* Snippet: stlessConsumer

class PAGE_NAME extends ConsumerWidget {
  const PAGE_NAME({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/addtodo.dart';
import 'package:todo_app/providers/todoprovider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Home Page'),
      ),

      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Slidable(
              // Create Delete Action
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) =>
                        ref.read(todoProvider.notifier).removeTodo(index),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  )
                ],
              ),

              // The Todo Item
              child: ListTile(
                title: Text(todos[index].content),
                trailing: Checkbox(
                  value: todos[index].completed,
                  onChanged: (value) {
                    ref
                        .read(todoProvider.notifier)
                        .toggleCompleteTodo(todos[index].content);
                  },
                ),
              ),
            );
          }),

      // Floating Action Button to the Add Todo Page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        tooltip: "Create a Todo",
        child: const Icon(Icons.add),
      ),

      // Create another floating action button to clear all completed Todos on the bottom left corner
      // if there are completed Todos

      bottomNavigationBar: todos.any((todo) => todo.completed)
          ? FloatingActionButton(
              onPressed: () {
                ref.read(todoProvider.notifier).clearCompletedTodos();
              },
              tooltip: "Clear all completed Todos",
              child: const Icon(Icons.clear),
            )
          : null,
    );
  }
}
