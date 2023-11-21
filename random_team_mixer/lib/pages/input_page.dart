import 'package:flutter/material.dart';

class RandomTeamMixer extends StatefulWidget {
  const RandomTeamMixer({Key? key}) : super(key: key);

  @override
  State<RandomTeamMixer> createState() => _RandomTeamMixerState();
}

class _RandomTeamMixerState extends State<RandomTeamMixer> {
  final TextEditingController _textFieldController = TextEditingController();
  Set<String> nameList = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random Team Mixer"),
          backgroundColor: Color.fromARGB(255, 23, 120, 206),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  labelText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    addNameToList();
                  },
                  child: const Text("Add to List"),
                ),
              ),
              const SizedBox(height: 50.0),
              Expanded(
                child: SingleChildScrollView(
                  child: nameList.isEmpty
                      ? Container():DataTable(
                    headingRowHeight: 70,
                    columns: [
                      DataColumn(
                        label: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Name List",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const DataColumn(label: Text("")),
                      const DataColumn(label: Text("")),
                    ],
                    rows: nameList
                        .map(
                          (name) => DataRow(
                            cells: [
                              DataCell(
                                Text(' '+name),
                              ),
                               const DataCell(
                                Text(''),
                              ),
                              DataCell(IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  removeNameFromList(name);
                                },
                              ))
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Confirm"),
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

    if (nameList.contains(newName)) {
      return;
    }
    if (newName.isEmpty) {
      return;
    }
    setState(() {
      nameList.add(newName);
      _textFieldController.clear();
    });
  }

  void removeNameFromList(String name) {
    setState(() {
      nameList.remove(name);
    });
  }
}

