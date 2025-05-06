import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final bool taskCompleted;
  Function(bool?)? onChanged;
  ToDoTile({super.key, required this.taskCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
