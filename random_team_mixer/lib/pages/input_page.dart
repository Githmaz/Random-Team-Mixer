import 'package:flutter/material.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _RandomTeamMixerState();
}

class _RandomTeamMixerState extends State<InputPage> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Random Team Mixer"),
          backgroundColor: Color.fromARGB(255, 153, 202, 209),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
              colors: [
                Color.fromARGB(255, 153, 202, 209),
                Color.fromARGB(255, 173, 144, 237)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                        labelText: 'Enter Name',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors
                                .white, // Change focused border color here
                          ),
                        )),
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
                              rows: List.generate(
                                nameList.length,
                                (index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      // Alternate row colors
                                      return index % 2 == 0
                                          ? Color.fromARGB(25, 255, 255, 255)
                                          : null;
                                    },
                                  ),
                                  cells: [
                                    DataCell(
                                      SizedBox(
                                        width: 160,
                                        child: Text(' ${nameList[index]}'),
                                      ),
                                    ),
                                    DataCell(
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          removeNameFromList(nameList[index]);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/groupOverview',
                          arguments: {'nameList': nameList});
                    },
                    child: const Text("Confirm"),
                  ),
                )
              ],
            ),
          ),
        ));
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
