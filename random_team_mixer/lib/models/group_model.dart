import 'package:flutter/material.dart';

class GroupModel {
  String groupName;
  List<String> groupMembers;
  Color backgroundColor;

  GroupModel(
      {required this.groupName,
      required this.groupMembers,
      required this.backgroundColor});
  
}
