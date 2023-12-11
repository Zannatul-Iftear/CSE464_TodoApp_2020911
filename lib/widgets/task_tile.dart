import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final VoidCallback checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  static const int myRed = 0xff93082a;
  static const int myWhite = 0xffeaeaea;
  static const int myBlack = 0xff202020;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationColor: isChecked ? Color(0xffdc1548) : null,
          color: isChecked ? Color(0xffdc1548) : Color(myWhite),
          fontStyle: isChecked ? FontStyle.italic : null,
          fontWeight: isChecked ? FontWeight.w300 : FontWeight.w700,
            fontSize: 18
        ),
      ),
      trailing: Checkbox(
        activeColor: Color(myRed),
        value: isChecked,
        shape: CircleBorder(),
        side: BorderSide(color: Color(myWhite)),
        onChanged: (value) {
          checkboxCallback();
        },
      ),
    );
  }
}
