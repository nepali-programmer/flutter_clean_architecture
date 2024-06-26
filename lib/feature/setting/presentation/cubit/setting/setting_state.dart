// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final bool darkMode;
  const SettingState({
    required this.darkMode,
  });

  @override
  List<Object> get props => [darkMode];

  SettingState copyWith({
    bool? darkMode,
  }) {
    return SettingState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
