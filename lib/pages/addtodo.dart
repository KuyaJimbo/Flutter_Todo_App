import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/todoprovider.dart';

class AddTodoPage extends ConsumerWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController NewTodo_controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: NewTodo_controller,
                decoration: const InputDecoration(
                  hintText: 'Enter a new Todo',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add a new Todo to the list
                ref
                    .read(todoProvider.notifier)
                    .addTodo(NewTodo_controller.text);
                Navigator.pop(context);
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
