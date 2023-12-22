import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Today\'s Toon!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        foregroundColor: Colors.green.shade600,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
