import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.notifications_none, color: Colors.orange),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Spacing at the top

            // Profile Picture
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
              ),
            ),
            SizedBox(height: 16), // Spacing below picture

            // User Name with level
            Text(
              "Rebeca Lee",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 50), // Spacing between profile details and menu

            // Menu Options
            buildMenuOption(Icons.article_outlined, "Posts"),
            buildMenuOption(Icons.edit_outlined, "Write"),
            buildMenuOptionWithNotification(
                Icons.message_outlined, "Message", 12),
            buildMenuOption(Icons.person_outline, "Profile"),

            Spacer(), // Push remaining items to the bottom

            // Log Out and Setting options at the bottom
            TextButton(
              onPressed: () {
                // Your logout logic here
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                backgroundColor: Colors.redAccent, // Button background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text(
                "Log out",
                style: TextStyle(
                  fontSize: 16, // Font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                // Your logout logic here
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                backgroundColor: Colors.blueGrey, // Button background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text(
                "Setting",
                style: TextStyle(
                  fontSize: 16, // Font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),

            SizedBox(height: 20), // Spacing at the bottom
          ],
        ),
      ),
    );
  }

  Widget buildMenuOption(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildMenuOptionWithNotification(
      IconData icon, String title, int notificationCount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              notificationCount.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomOption(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
