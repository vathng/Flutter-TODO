import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[''];
  final List<String> msg = <String>[''];

  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      msg.insert(0, nameController1.text);
      nameController.clear();
      nameController1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TODO APP'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: nameController1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.purple,
              margin: EdgeInsets.all(2),
              child: Align(
                alignment: Alignment.center,
                child: Column(children: [
                  Text(
                    '${names[index]} ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${msg[index]}',
                    style: TextStyle(fontSize: 18),
                    maxLines: 3,
                  )
                ]),
              ),
            );
          },
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () => {addItemToList()},
      ),
    );
  }
}
