import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(
              context,
            ).viewInsets.bottom, // Push up when keyboard appears
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Enter your message"),
          TextField(decoration: InputDecoration(hintText: 'Type here...')),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
