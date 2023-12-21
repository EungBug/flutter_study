import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE64D3D),
        ),
        primaryColor: const Color(0xFFE64D3D),
        fontFamily: 'esamanru',
      ),
      home: const HomeScreen(),
    );
  }
}
