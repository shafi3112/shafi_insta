import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_basic_feed/bloclike/theme_bloc.dart';
import 'package:instagram_basic_feed/screen/feedscreen.dart' ;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppThemeBloc>(
      create: (context) => AppThemeBloc(),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            home: FeedScreen(),
          );
        },
      ),
    );

  }
}



