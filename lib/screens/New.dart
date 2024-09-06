import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  final List<Map<String, String>> contacts = [
    {'name': 'Alice', 'number': '123-456-7890'},
    {'name': 'Bob', 'number': '987-654-3210'},
    {'name': 'Charlie', 'number': '456-789-0123'},
    {'name': 'David', 'number': '321-654-9870'},
    {'name': 'Eve', 'number': '789-012-3456'},
  ];
  final List<Color> avatarColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // Remove shadow
        toolbarHeight: 60,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back button action
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 700,
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search or enter code',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none, // Remove underline
                        contentPadding: EdgeInsets.only(left: 15), // Adjust left padding here
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.keyboard_alt_outlined, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Row(
                children: [
                  Icon(Icons.create, color: Colors.blueGrey),
                  SizedBox(width: 15),
                  Text(
                    "Create a new meeting",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text(
                    "Schedule in Google Calendar",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Row(
                children: [
                  Icon(Icons.group, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text(
                    "Create group",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Text(
                'Connect on Meet',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  String name = contacts[index]['name']!;
                  String number = contacts[index]['number']!;
                  Color avatarColor = avatarColors[index % avatarColors.length]; // Cycle through colors

                  return Container(
                    margin: EdgeInsets.only(bottom: 10), // Space between list items
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: avatarColor, // Different color for each contact
                        child: Text(
                          name[0], // Display first letter of the name
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        name,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        number,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
