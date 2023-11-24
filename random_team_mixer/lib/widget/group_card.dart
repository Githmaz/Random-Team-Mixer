import 'package:flutter/material.dart';
import 'package:random_team_mixer/models/group_model.dart';

class GroupCard extends StatelessWidget {
  final GroupModel group;

  const GroupCard({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      color: group.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Group Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              group.groupName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Group Members
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Group Members :',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              // Display group members
              for (String member in group.groupMembers)
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: Text(
                    member,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
