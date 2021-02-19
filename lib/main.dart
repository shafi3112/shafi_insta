import 'package:flutter/material.dart';
import 'package:instagram_basic_feed/screen/feedscreen.dart' ;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedScreen(),
    );
  }
}



