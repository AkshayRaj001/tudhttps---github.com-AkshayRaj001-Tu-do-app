import 'package:flutter/material.dart';
import 'package:tudo/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,
  required this.controller,
  required this.onSave,
  required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[300],
      content: Container(
        height: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task "
              ),
            ),
            //button save + cancel
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButton(text: "save", onPressed: onSave),
                const SizedBox(width: 4,),
                //cancel
                MyButton(text: "Cancel", onPressed: onCancel),
                
               
              ],
            )
          ],
        ),
      ),
    );
  }
}