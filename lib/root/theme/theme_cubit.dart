import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cache/cache_manager.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial());

  onThemeChange(ThemeMode themeMode) {
    CacheManager().themeMode = themeMode;
    print("new theme mode $themeMode");
    switch (themeMode) {
      case ThemeMode.system:  //Todo
        emit(const ThemeInitial());
      case ThemeMode.dark:
        emit(const ThemeDark());
            break;
      case ThemeMode.light:
        emit(const ThemeLight());
        break;
    }
  }
}
