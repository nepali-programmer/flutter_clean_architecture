import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/di/di.dart';
import 'package:flutter_clean_architecture/feature/todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:flutter_clean_architecture/feature/todo/presentation/screen/todo_list_screen/todo_list_screen.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoCubit>(),
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoListScreen(),
      ),
    );
  }
}
