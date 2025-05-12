import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final controller;
  VoidCallback onPressed;
  NewTask({super.key, required this.onPressed, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(
              context,
            ).viewInsets.bottom, // Push up when keyboard appears
        left: 25,
        right: 16,
        top: 24,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter Task'),
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                "Create",
                style: TextStyle(fontSize: 17, color: Color(0xff404040)),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xffe5e5e5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
