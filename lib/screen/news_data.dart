import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

class NewsData extends StatefulWidget {
  NewsModel? newsModel;
  NewsData({super.key, this.newsModel});

  @override
  State<NewsData> createState() => _NewsDataState();
}

class _NewsDataState extends State<NewsData> {
  @override
  Widget build(BuildContext context) {
    var news = widget.newsModel;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: news == null
          ? Center(child: Text('No News Data Available'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // News Image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: news.urlToImage != null
                      ? Image.network(
                          news.urlToImage!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/placeholder.png',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(height: 16), // Spacing

                // News Author (check for null)
                Text(
                  news.author != null ? news.author! : 'Unknown Author',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8), // Spacing

                // News Title
                Text(
                  news.title ?? 'No Title Available',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Spacing

                // News Description with max lines and ellipsis
                Text(
                  news.description ?? 'No Description Available',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
    );
  }
}
