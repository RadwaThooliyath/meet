import 'package:flutter/material.dart';
import 'package:meet/screens/New.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> historyData = [
    {
      'name': 'John Doe',
      'description': 'Audio call',
      'date': 'Yesterday',
      'isIncoming': true,
      'color': Colors.blue,
    },
    {
      'name': 'Emily Devis',
      'description': 'Video call',
      'date': '2 Days Ago',
      'isIncoming': true,
      'color': Colors.cyan,
    },
    {
      'name': 'Jane Smith',
      'description': 'Video call',
      'date': 'Today',
      'isIncoming': false,
      'color': Colors.green,
    },
    {
      'name': 'Robin Sebastian',
      'description': 'Audio call',
      'date': '2 Days Ago',
      'isIncoming': true,
      'color': Colors.brown,
    },
    {
      'name': 'Alex Johnson',
      'description': 'Video call',
      'date': '2 Days Ago',
      'isIncoming': true,
      'color': Colors.red,
    },
    {
      'name': 'Richard',
      'description': 'Audio call',
      'date': '2 Days Ago',
      'isIncoming': true,
      'color': Colors.orange,
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.grey[900], // Set the background color
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Google Meet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: Colors.white),
              title: Text('Privacy in Meet', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.white),
              title: Text('Help & Feedback', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add the search bar at the top
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                prefixIcon: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                hintText: 'Search or enter code',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Add some spacing
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "History",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                final item = historyData[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: item['color'],
                    child: Text(
                      item['name'][0],
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  title: Text(
                    item['name'],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  subtitle: Text(
                    item['description'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item['date'],
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        item['isIncoming'] ? Icons.call_received : Icons.call_made,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => New(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        icon: Icon(Icons.video_call_outlined, color: Colors.white),
        label: Text('New'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
