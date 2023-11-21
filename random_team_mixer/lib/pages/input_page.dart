import 'package:flutter/material.dart';

class RandomTeamMixer extends StatefulWidget {
  const RandomTeamMixer({Key? key}) : super(key: key);

  @override
  State<RandomTeamMixer> createState() => _RandomTeamMixerState();
}

class _RandomTeamMixerState extends State<RandomTeamMixer> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random Team Mixer"),
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                
                  labelText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  addNameToList();
                },
                child: const Text("Add to List"),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Name List")),
                    ],
                    rows: nameList
                        .map(
                          (item) => DataRow(
                            cells: [
                              DataCell(
                                Text(item),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addNameToList() {
    String newName = _textFieldController.text;
    if (newName.isNotEmpty) {
      setState(() {
        nameList.add(newName);
        _textFieldController.clear();
      });
    }
  }
}
