import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/TaskData.dart';

class AddTaskScreen extends StatelessWidget {
  static const int myRed = 0xff93082a;
  static const int myWhite = 0xffeaeaea;
  static const int myBlack = 0xff202020;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: Color(myBlack),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(myRed),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Color(myWhite),
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20),
            TextField(
              autofocus: true,
              textAlign: TextAlign.start,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              style: TextStyle(color: Color(myWhite), fontSize: 18),
              decoration: InputDecoration(
                filled: true, fillColor: Color(myBlack),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(myWhite)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(myWhite)),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(myWhite),
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Color(myRed),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
