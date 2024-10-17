import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_api/model/news_model.dart';

class NewsApiService {
  var everything_api =
      "https://newsapi.org/v2/everything?q=business&apiKey=4e205c462fdc4bccb7b2bf9e72ead59d";
  var top_headline_api =
      "https://newsapi.org/v2/top-headlines?category=business&apiKey=4e205c462fdc4bccb7b2bf9e72ead59d";
  Future<List<NewsModel>> everythingNews() async {
    try {
      Response response = await http.get(Uri.parse(everything_api));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];

        List<NewsModel> articleList =
            body.map((news) => NewsModel.fromJson(news)).toList();
        return articleList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> topNews() async {
    try {
      Response response = await http.get(Uri.parse(top_headline_api));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];

        List<NewsModel> articleList =
            body.map((news) => NewsModel.fromJson(news)).toList();
        return articleList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
