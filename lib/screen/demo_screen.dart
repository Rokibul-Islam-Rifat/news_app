//=================================================

// TopNews.dart part
import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/news_api/news_api_service.dart';
import 'package:news_api/screen/news_data.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  NewsApiService newsApiService = NewsApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: FutureBuilder(
          future: newsApiService.topNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleList = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    return NewsData(
                      newsModel: articleList[index],
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
// ======================================
//Everything news. dart part
