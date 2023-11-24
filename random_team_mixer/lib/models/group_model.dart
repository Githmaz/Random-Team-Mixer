import 'package:flutter/material.dart';

class GroupModel {
  String groupName;
  List<String> groupMembers;
  Color backgroundColor;

  GroupModel(
      {required this.groupName,
      required this.groupMembers,
      required this.backgroundColor});

  static List<GroupModel> generateGroupModels(List<List<String>> groups) {
    List<Color> customColors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];

    return groups.map((group) {
      String groupName = 'Group ${groups.indexOf(group) + 1}';
      Color backgroundColor =
          customColors[groups.indexOf(group) % customColors.length];
      return GroupModel(
        groupName: groupName,
        groupMembers: group,
        backgroundColor: backgroundColor,
      );
    }).toList();
  }
}
