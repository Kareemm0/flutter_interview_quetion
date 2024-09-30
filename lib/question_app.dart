import 'package:flutter/material.dart';

import 'Screens/nav_bar_screen.dart';

class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const NavBarScreen(),
    );
  }
}
