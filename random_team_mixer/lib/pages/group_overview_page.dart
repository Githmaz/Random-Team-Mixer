import 'package:flutter/material.dart';
import 'package:random_team_mixer/models/group_model.dart';
import 'package:random_team_mixer/widget/group_card.dart';

class GroupOverView extends StatefulWidget {
  const GroupOverView({super.key});

  @override
  State<GroupOverView> createState() => _GroupOverViewState();
}

class _GroupOverViewState extends State<GroupOverView> {
  List<String> nameList = [];
  List<List<String>> groupList = [
    ['John', 'Jane', 'Bob'],
    ['Alice', 'Charlie', 'David'],
    ['Eva', 'Frank', 'Grace'],
  ];
  List<GroupCard> groupcardList = [
    GroupCard(
      group: GroupModel(
        groupName: 'Group 1',
        groupMembers: ['John', 'Jane', 'Bob'],
        backgroundColor: Colors.blue,
      ),
    ),
    GroupCard(
      group: GroupModel(
        groupName: 'Group 1',
        groupMembers: ['John', 'Jane', 'Bob'],
        backgroundColor: Colors.blue,
      ),
    ),
    GroupCard(
      group: GroupModel(
        groupName: 'Group 2',
        groupMembers: ['Alice', 'Charlie', 'David'],
        backgroundColor: Colors.green,
      ),
    ),
    GroupCard(
        group: GroupModel(
      groupName: 'Group 3',
      groupMembers: ['Eva', 'Frank', 'Grace'],
      backgroundColor: Colors.orange,
    ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [...groupcardList],
      ),
    );
  }
}
