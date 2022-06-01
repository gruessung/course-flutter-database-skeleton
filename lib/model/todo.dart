import 'package:flutter/material.dart';

class Todo {

  Todo({required this.title, required this.done, required this.dueDate});

  String title = "";
  bool done = false;
  String dueDate = "";
}