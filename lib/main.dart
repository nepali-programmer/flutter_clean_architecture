import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/di/di.dart';
import 'package:flutter_clean_architecture/feature/setting/presentation/cubit/setting/setting_cubit.dart';
import 'package:flutter_clean_architecture/feature/todo/presentation/cubit/todo/todo_cubit.dart';
import 'package:flutter_clean_architecture/feature/todo/presentation/screen/todo_list_screen/todo_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TodoCubit>()),
        BlocProvider(create: (context) => getIt<SettingCubit>())
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      buildWhen: (previous, current) => previous.darkMode != current.darkMode,
      builder: (context, settingState) {
        return MaterialApp(
          title: 'Flutter Clean Architecture',
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          themeMode: settingState.darkMode ? ThemeMode.dark : ThemeMode.light,
          home: const TodoListScreen(),
        );
      },
    );
  }
}
