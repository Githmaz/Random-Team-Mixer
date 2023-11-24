import 'package:flutter/material.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Team Mixer"),
        backgroundColor: const Color.fromARGB(255, 153, 202, 209),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    addNameToList();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // text color
                  ),
                  child: const Text("Add to the List"),
                ),
              ),
              // Add Clear All button here
              nameList.isEmpty
                  ? Container()
                  : SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showAlert(
                              "Clear List Confirmation",
                              "Are you sure you want to clear the list?",
                              "Yes");
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red, // text color
                        ),
                        child: const Text("Clear All"),
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                    return index % 2 == 0
                                        ? const Color.fromARGB(
                                            25, 255, 255, 255)
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
                                        setState(() {
                                          nameList.removeAt(index);
                                        });
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
                    confirmList();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green, // text color
                  ),
                  child: const Text("Confirm"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(String alertTitle, String alertContent, String type) {
    // type = 0 for Clear All Dialog  , type = 1 for warnning Dialogs
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertTitle),
            content: Text(alertContent),
            actions: [
              type == "Yes"
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 224, 51, 51),
                        foregroundColor:
                            const Color.fromARGB(255, 229, 228, 235),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('No'),
                    )
                  : Container(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (type == "Yes") {
                      setState(() {
                        nameList.clear();
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 174, 46),
                      foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text(type)),
            ],
          );
        });
  }

  void addNameToList() {
    String newName = _textFieldController.text;

    if (nameList.contains(newName)) {
      showAlert(
          "Duplicate Entry",
          "The name \"$newName\" is already in the list. Please choose a different name.",
          "Ok");
      return;
    }
    if (newName.isEmpty) {
      showAlert("Invalid Entry",
          "Please enter a valid name. Null values are not accepted.", "Ok");
      return;
    }
    setState(() {
      nameList.add(newName);
      _textFieldController.clear();
    });
  }

  void confirmList() {
    if (nameList.length < 14) {
      showAlert(
          "Insufficient Names",
          "To proceed, the name list must contain more than 14 names. (${14 - nameList.length} names left)",
          "Ok");
      return;
    }

    Navigator.pushNamed(context, '/groupOverview',
        arguments: {'nameList': nameList});
  }
}
