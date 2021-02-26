part of 'theme_bloc.dart';

class AppThemeState extends Equatable{
  final ThemeData theme;
  const AppThemeState({this.theme});

  @override
  List<Object> get props => [theme];
}