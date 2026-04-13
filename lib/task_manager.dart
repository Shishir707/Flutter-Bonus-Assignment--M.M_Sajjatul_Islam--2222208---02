import 'package:bonus_assignment/add_task.dart';
import 'package:bonus_assignment/widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model_class.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final List<TaskModel> _tasks = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),

      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firestore.collection('task').snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          }

          if (asyncSnapshot.hasData) {
            _tasks.clear();

            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
                in asyncSnapshot.data!.docs) {
              _tasks.add(TaskModel.fromJson(doc.data()));
            }

            return uiResult();
          }

          return Center(child: Text("No data"));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: onPressedAddTask,
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.limeAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressedAddTask() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddTask()));
  }


  ListView uiResult() {
    return ListView.separated(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];

        return ListTile(
          title: Text(
            task.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(task.description),


          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
