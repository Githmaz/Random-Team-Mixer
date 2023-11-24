import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_team_mixer/models/group_model.dart';
import 'package:random_team_mixer/widget/group_card.dart';

class GroupOverView extends StatefulWidget {
  final List<String> nameList;

  const GroupOverView({Key? key, required this.nameList}) : super(key: key);

  @override
  State<GroupOverView> createState() => _GroupOverViewState();
}

class _GroupOverViewState extends State<GroupOverView> {
  @override
  Widget build(BuildContext context) {
    List<String> localNameList = widget.nameList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups Overview"),
        backgroundColor: const Color.fromARGB(161, 23, 81, 226),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/group_overview_page_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: GroupModel.generateGroupModels(
                  generateRandomGroups(localNameList))
              .map((group) => GroupCard(group: group))
              .toList(),
        ),
      ),
    );
  }
}

List<List<String>> generateRandomGroups(List<String> names) {
  names.shuffle();

  List<List<String>> groups = [];

  for (int i = 0; i < names.length ~/ 5; i++) {
    groups.add(names.sublist(i * 5, (i + 1) * 5));
  }

  if (names.length % 5 == 4) {
    groups.add(names.sublist(names.length - 4, names.length));
    return groups;
  }

  for (int i = names.length - names.length % 5; i < names.length; i++) {
    while (true) {
      int whichTeam = Random().nextInt(groups.length);
      if (groups[whichTeam].length < 6) {
        groups[whichTeam].add(names[i]);
        break;
      }
    }
  }
  return groups;
}
