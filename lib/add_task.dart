import 'package:bonus_assignment/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tmAppBar(),
    );
  }
}
