import 'package:flutter/material.dart';
import 'package:test_bloc/pages/teste_page.dart';

import 'pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/listTask",
      routes: {
        "/listTask": (context) => const TaskPage(),
        "/testePage": (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map;

          return TestePage(taskModel: args["task"]);
        }
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskPage(),
    );
  }
}
