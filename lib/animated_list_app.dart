import 'package:animated_list/screens/animated_list_screen.dart';
import 'package:flutter/material.dart';

class AnimatedListApp extends StatelessWidget {
  const AnimatedListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedListScreen(title: 'Flutter Animated List Example'),
    );
  }
}
