import 'package:hive/hive.dart';


class TodoDataBase{
  List ToDoname=[];
  //reference our box
  final _myBox =Hive.box("mybox");
  //run this method if this the list oening the app
  void createInitialData(){
    ToDoname =[
      ["Akshay",false],
      ["love",false],
      ["Adina",false]
    ];
  }
  //load the data
  void loadData(){

ToDoname =_myBox.get("TODOLIST");
  }

  ///update data
  void updateDataBase(){

_myBox.put("TTODOLIST", ToDoname);
  }
}