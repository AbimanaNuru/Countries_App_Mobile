import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}

class InitializeThemeEvent extends ThemeEvent {}

// State
class ThemeState extends Equatable {
  const ThemeState({required this.isDarkMode});
  final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkMode: false)) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<InitializeThemeEvent>(_onInitializeTheme);

    // Initialize theme from shared preferences
    add(InitializeThemeEvent());
  }
  static const String THEME_KEY = 'is_dark_mode';

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final newState = !state.isDarkMode;
    emit(ThemeState(isDarkMode: newState));

    // Save to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_KEY, newState);
  }

  Future<void> _onInitializeTheme(
    InitializeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(THEME_KEY) ?? false;
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
