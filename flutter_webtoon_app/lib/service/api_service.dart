import 'dart:convert';

import 'package:flutter_webtoon_app/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';

  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();
  }
}
