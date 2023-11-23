import 'package:flutter/material.dart';

class GroupOverView extends StatefulWidget {
  const GroupOverView({super.key});

  @override
  State<GroupOverView> createState() => _GroupOverViewState();
}

class _GroupOverViewState extends State<GroupOverView> {
  final Set<String> nameList = {} ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("xxx"),
    );
  }
}
