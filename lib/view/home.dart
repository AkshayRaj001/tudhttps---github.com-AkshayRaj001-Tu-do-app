import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tudo/data/dataBase.dart';
import 'package:tudo/utils/ToDoList.dart';
import 'package:tudo/utils/dialog_box.dart';

class Home extends StatefulWidget {
 
  const Home({super.key});
  
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  final _myBox =Hive.box("mybox");
  TodoDataBase db=TodoDataBase();
  @override   
   
   
  void initState() {
    // if this is the list time open the app
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
  //text controller
  final _controller = TextEditingController();
  //list of tudo task
 
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db. ToDoname[index][1] = !db. ToDoname[index][1];
    });
    db.updateDataBase();
  }
  //save a new task
  void saveNewtask(){
    
    setState(() {
     db. ToDoname.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
//create a new task
  void CreateNewtask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              controller: _controller,
              onSave: saveNewtask,
              onCancel: () => Navigator.of(context).pop(),
            ));
  }
  //delect task
  void delectTask(int index){
    setState(() {
     db. ToDoname.removeAt(index);
    });
    db.updateDataBase();
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
            itemCount:db. ToDoname.length,
            itemBuilder: (context, index) {
              return ToDoList(
                  taskname:db. ToDoname[index][0],
                  taskcompleted:db. ToDoname[index][1],
                  onChanged: (value) => checkboxChanged(value!, index),
                  deleteFuntion: (context) =>delectTask(index) ,);
            }));
  }
}
