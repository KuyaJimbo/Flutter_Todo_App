import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/home.dart';

void main() {
  // runApp makes the provided widget the root of the widget tree
  // ProviderScope is a widget that allows you to read providers in the widget tree
  // MyApp acts as the root widget of the app
  runApp(const ProviderScope(child: MyApp()));
}

// StatelessWidget is a widget that does not require mutable state
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // the build method is called to build the widget tree
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(), // home is the default route of the app
    );
  }
}
