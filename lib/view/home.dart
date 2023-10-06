import 'package:flutter/material.dart';
import 'package:tudo/utils/ToDoList.dart';
import 'package:tudo/utils/dialog_box.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List ToDoname = [
    ["Akshay", false],
    ["albin", false],
    ["hari", false]
  ];
  void checkboxChanged(bool? value, int index) {
    setState(() {
      ToDoname[index][1] = !ToDoname[index][1];
    });
  }

  void CreateNewtask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.add),
          onPressed: CreateNewtask,
        ),
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 0,
          title: Center(child: Text("TO DO")),
        ),
        body: ListView.builder(
            itemCount: ToDoname.length,
            itemBuilder: (context, index) {
              return ToDoList(
                  taskname: ToDoname[index][0],
                  taskcompleted: ToDoname[index][1],
                  onChanged: (value) => checkboxChanged(value, index));
            }));
  }
}
