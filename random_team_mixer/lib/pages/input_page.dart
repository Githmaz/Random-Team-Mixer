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
          backgroundColor: const Color.fromARGB(255, 23, 120, 206),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Name',
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    addNameToList();
                  },
                  child: const Text("Add to List"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: SingleChildScrollView(
                    child: nameList.isEmpty
                        ? Container()
                        : DataTable(
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
                            ],
                            rows: nameList
                                .map(
                                  (name) => DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: 160,
                                          child: Text(' $name'),
                                        ),
                                      ),
                                      DataCell(
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            removeNameFromList(name);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RandomTeamMixer()));
                  },
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
      showAlert("Duplicate Entry",
          "The name \"$newName\" is already in the list. Please choose a different name.");
      return;
    }
    if (newName.isEmpty) {
      showAlert("Invalid Entry",
          "Please enter a valid name. Null values are not accepted.");
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

  void showAlert(String alertTitle, String alertContent) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertTitle),
            content: Text(alertContent),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 227, 79, 79),
                      foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text('Ok')),
            ],
          );
        });
  }
}
