import 'package:flutter/material.dart';
import 'package:flutter_webtoon_app/models/webtoon.dart';
import 'package:flutter_webtoon_app/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('data!');
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
