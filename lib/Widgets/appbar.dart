import 'package:flutter/material.dart';

PreferredSizeWidget tmAppBar() {
  return AppBar(
    title: Text(
      "Task Manager",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.yellow[400],
  );
}