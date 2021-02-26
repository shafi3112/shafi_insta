import 'package:flutter/material.dart';
import 'package:instagram_basic_feed/providercodes/themecolrs.dart';
import 'package:instagram_basic_feed/screen/feedscreen.dart' ;
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.darkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
          home: FeedScreen(),
        );
      }
    ),
    );
  }
}



