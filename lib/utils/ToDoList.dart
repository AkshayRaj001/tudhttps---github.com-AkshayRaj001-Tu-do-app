// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
class ToDoList extends StatefulWidget {
  final String taskname;
   final taskcompleted;
  Function(bool?)? onChanged;
  ToDoList(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    
    var taskcompleted;
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
              value: widget.taskcompleted,
              onChanged: widget.onChanged,
              activeColor: Colors.black,
            ),
            Text(
              widget.taskname,
              style: TextStyle(
                  decoration:taskcompleted ? TextDecoration.lineThrough:TextDecoration.none),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.pink),
      ),
    );
  }
}
