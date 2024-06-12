
part of 'theme_cubit.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial():super(themeMode: ThemeMode.light); //todo themeMode.system

}


class ThemeDark extends ThemeState {
  const ThemeDark():super(themeMode: ThemeMode.dark);
}
class ThemeLight extends ThemeState {
  const ThemeLight():super(themeMode: ThemeMode.light);
}