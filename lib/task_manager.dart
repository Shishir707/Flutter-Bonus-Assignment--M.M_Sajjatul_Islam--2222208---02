import 'package:bonus_assignment/widgets/appbar.dart';
import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.limeAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
