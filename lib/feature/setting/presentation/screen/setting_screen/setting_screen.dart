import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/feature/setting/presentation/cubit/setting/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: ListView(
        children: [
          BlocBuilder<SettingCubit, SettingState>(
            buildWhen: (previous, current) => previous.darkMode != current.darkMode,
            builder: (context, settingState) {
              return SwitchListTile(
                value: settingState.darkMode,
                title: const Text('Dark Mode'),
                onChanged: (value) {
                  context.read<SettingCubit>().setDarkMode(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
