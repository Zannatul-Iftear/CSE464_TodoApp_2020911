import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/TaskData.dart';
import 'package:todo/models/task.dart';

import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:flutter/services.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});


  @override
  State<TasksScreen> createState() => _TasksScreenState();
}


class _TasksScreenState extends State<TasksScreen> {
  static const int myRed = 0xff93082a;
  static const int myWhite = 0xffeaeaea;
  static const int myBlack = 0xff202020;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(myWhite),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: Color(myRed),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(myRed),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                ),
              ),
            );
          },
          shape: CircleBorder(),
          child: const Icon(Icons.add, color: Color(myWhite)),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(myWhite),
                ),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/img/logoFull.png'),
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 40, left: 30, right: 30, bottom: 30
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/logoD.png'),
                      fit: BoxFit.cover,
                      // Use 'contain' to avoid stretching
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage ("assets/img/iftear.png"),
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Md Zannatul Iftear",
                                style: TextStyle(
                                  color: Color(myWhite),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text("2020911@iub.edu.bd",
                                style: TextStyle(
                                  color: Color(myWhite),
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text("My Tasks",
                        style: TextStyle(
                          color: Color(myWhite),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "${Provider.of<TaskData>(context).completedTasks} out of ${Provider.of<TaskData>(context).taskCount} Tasks Complete",
                        style: TextStyle(
                          color: Color(myWhite),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(myBlack),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TasksList(),
                ),
              )
            ],
          ),
        )
    );
  }
}
