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
            image:
                AssetImage("lib/assets/group_overview_page_background.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: GroupModel.generateGroupModels(
                  generateRandomGroups(localNameList, 2))
              .map((group) => GroupCard(group: group))
              .toList(),
        ),
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
