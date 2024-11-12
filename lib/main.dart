import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app_with_bloc/ui/task_screen.dart';

import 'bloc/task_bloc.dart';
import 'bloc/task_event.dart';
import 'data/api/dio_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(DioClient().dio)..add(FetchTasks()),
      child: MaterialApp(
        title: 'Flutter Task Manager',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TaskScreen(),
      ),
    );
  }
}
