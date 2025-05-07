import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback onTapped;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: taskCompleted ? Color(0xffdcfce7) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CupertinoCheckbox(
            value: taskCompleted,
            onChanged: onChanged,
            side: BorderSide(
              color:
                  taskCompleted
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.inactiveGray,
            ),
            activeColor: Colors.transparent,

            checkColor: CupertinoColors.activeGreen,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  softWrap: true,
                ),
                Text(
                  '$date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          // Expanded(child: SizedBox()),
          IconButton(
            onPressed: onTapped,
            icon: Icon(CupertinoIcons.delete, color: Colors.red, size: 17),
          ),
        ],
      ),
    );
  }
}
