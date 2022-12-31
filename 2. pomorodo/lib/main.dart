import 'package:flutter/material.dart';
import 'package:pomorodo/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: const Color(0xffe7626c),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Color(0xff232b55),
            ),
          ),
          cardColor: const Color(0xfff4eddb),
        ),
        home: const HomeScreen());
  }
}
