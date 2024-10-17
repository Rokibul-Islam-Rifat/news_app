import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/news_api/news_api_service.dart';
import 'package:news_api/screen/details_screen.dart';

class EverythingNews extends StatefulWidget {
  const EverythingNews({super.key});

  @override
  State<EverythingNews> createState() => _EverythingNewsState();
}

class _EverythingNewsState extends State<EverythingNews> {
  NewsApiService newsApiService = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: const Text('Everything News'),
        backgroundColor: Colors.cyan[50],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: newsApiService.everythingNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                var article = articleList[index];
                return Card(
                  elevation: 4, // Adds shadow to the card
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display article image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            article.urlToImage ??
                                'https://via.placeholder.com/150',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset('assets/placeholder.png',
                                    fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Article title
                        Text(
                          article.title ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Article description
                        Text(
                          article.description ?? 'No Description',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        // Read more button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsScreen(newsModel: articleList[index],)));
                            },
                            child: const Text(
                              'Read More',
                              style: TextStyle(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
