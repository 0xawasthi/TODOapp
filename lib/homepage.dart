import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/bottom_sheet.dart';
import 'package:todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  // List of tasks
  List toDoList = [
    ['do work', false],
    ['do work', false],
    ['do work', false],
  ];

  // checkBox change
  void checkBoxChanged(value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Create new task
  void saveNewTask() {
    setState(() {
      toDoList.insert(0, [controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Delete tasks
  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    var taskCount = toDoList.length;
    // Separate pending and completed tasks
    List pendingTasks = toDoList.where((task) => task[1] == false).toList();
    List completedTasks = toDoList.where((task) => task[1] == true).toList();

    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NewTask(
                    onPressed: saveNewTask,
                    controller: controller,
                  );
                },
              );
            },
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
                  child: ListView(
                    children: [
                      // Pending Tasks
                      ...pendingTasks.asMap().entries.map((entry) {
                        int originalIndex = toDoList.indexOf(
                          entry.value,
                        ); // Actual index
                        return ToDoTile(
                          taskName: entry.value[0],
                          taskCompleted: entry.value[1],
                          onTapped: () => deleteTask(originalIndex),
                          onChanged:
                              (value) => checkBoxChanged(value, originalIndex),
                        );
                      }),
                      SizedBox(height: 12),

                      // Completed Tasks Section
                      ExpansionTile(
                        title: Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children:
                            completedTasks.asMap().entries.map((entry) {
                              int originalIndex = toDoList.indexOf(
                                entry.value,
                              ); // Actual index
                              return ToDoTile(
                                taskName: entry.value[0],
                                taskCompleted: entry.value[1],
                                onTapped: () => deleteTask(originalIndex),
                                onChanged:
                                    (value) =>
                                        checkBoxChanged(value, originalIndex),
                              );
                            }).toList(),
                      ),
                    ],
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
