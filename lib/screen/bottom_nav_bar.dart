import 'package:flutter/material.dart';
import 'package:news_api/screen/everything_news.dart';
import 'package:news_api/screen/gallery_page.dart';
import 'package:news_api/screen/profile_page.dart';
import 'package:news_api/screen/top_news.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _pages = [
    EverythingNews(),
    TopNews(),
    GalleryPage(),
    ProfilePage()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26, // Slightly smaller for simplicity
        backgroundColor: Colors.white
            .withOpacity(0.7), // Subtle transparency for a clean look
        type: BottomNavigationBarType.fixed,
        elevation: 0, // Remove shadow for flat design
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Top News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan, // Softer color for selection
        unselectedItemColor: Colors.grey.shade500, // Light grey for unselected
        selectedLabelStyle: TextStyle(
          fontSize: 12, // Smaller font size for cleaner text
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10, // Even smaller for unselected labels
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
