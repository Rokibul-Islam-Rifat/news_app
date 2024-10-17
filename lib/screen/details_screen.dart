import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_api/model/news_model.dart';

class DetailsScreen extends StatefulWidget {
  final NewsModel? newsModel;
  const DetailsScreen({super.key, this.newsModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Format the date if available
    String formatDate(String? date) {
      if (date == null) return 'Unknown Date';
      final parsedDate = DateTime.tryParse(date);
      return parsedDate != null
          ? Jiffy.now().format(pattern: 'MMM do yy')
          : 'Unknown Date';
    }

    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: const Text('News Details'),
        backgroundColor: Colors.cyan[50],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News Image with rounded corners, shadow, and loading indicator
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      widget.newsModel!.urlToImage ??
                          'https://via.placeholder.com/150',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/placeholder.png',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        color: Colors.black54,
                        child: Text(
                          formatDate(widget.newsModel!.publishedAt),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Author and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'By: ${widget.newsModel!.author ?? 'Unknown Author'}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // News Title
              Text(
                widget.newsModel!.title ?? 'No Title Available',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Divider for section separation
              const Divider(thickness: 2),

              // News Description
              Text(
                widget.newsModel!.description ?? 'No Description Available',
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Divider
              const Divider(thickness: 2),

              // News Content (if available)
              widget.newsModel!.content != null
                  ? Text(
                      widget.newsModel!.content!,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    )
                  : const Text(
                      'No content available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
              const SizedBox(height: 20),

              // Share and Save Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Add share functionality
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Add save functionality
                    },
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
