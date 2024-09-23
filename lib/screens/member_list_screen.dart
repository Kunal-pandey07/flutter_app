import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'route_screen.dart';
import '../models/member.dart';

class MemberListScreen extends StatelessWidget {
  final List<Member> memberList = [
    Member(name: "John Doe", id: "001"),
    Member(name: "Jane Smith", id: "002"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance')),
      body: ListView.builder(
        itemCount: memberList.length,
        itemBuilder: (context, index) {
          final member = memberList[index];
          return ListTile(
            title: Text(member.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(member: member),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.route),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteScreen(member: member),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
