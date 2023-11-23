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
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: GroupModel.generateGroupModels(
                generateRandomGroups(localNameList, 2))
            .map((group) => GroupCard(group: group))
            .toList(),
      ),
    );
  }
}

List<List<String>> generateRandomGroups(List<String> inputList, int chunkSize) {
  List<List<String>> dividedList = [];

  for (int i = 0; i < inputList.length - 1; i += chunkSize) {
    List<String> chunk = inputList.sublist(i, i + chunkSize);
    dividedList.add(chunk);
  }

  return dividedList;
}
