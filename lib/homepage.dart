import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['make todo app and push it in github within the day end ', false],
    ['make todo app', false],
    ['make todo app', true],
    ['make todo app', false],
  ];

  // checkBox change
  void checkBoxChanged(value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Delete tasks
  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // Add new tasks
  void addNewTask() {}

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    var taskCount = toDoList.length;
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: addNewTask,
            backgroundColor: Color(0xff10B981),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            child: Icon(Icons.add),
          ),

          body: Container(
            height: h,
            width: w,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning User !",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 6),
                Text(
                  "You have $taskCount tasks",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16),
                Text(
                  "To Do",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: taskCount,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoTile(
                        taskName: toDoList[index][0],
                        taskCompleted: toDoList[index][1],
                        onTapped: () => deleteTask(index),
                        onChanged: (value) => checkBoxChanged(value, index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
