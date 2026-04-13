import 'package:bonus_assignment/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                controller: _tittleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: addTask,
                  child: Text("Add Task"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {}
}
