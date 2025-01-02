import 'package:flutter/material.dart';
import 'package:pagination_app/view_model/post_viewmodel.dart';
import 'package:pagination_app/view_model/todoview_model.dart';
import 'package:pagination_app/views/todo_view.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PostViewModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => TodoViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoView(),
    );
  }
}
