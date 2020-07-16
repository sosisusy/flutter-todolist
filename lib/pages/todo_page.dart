import 'package:flutter/material.dart';
import 'package:redux_logging_example/widgets/todo/todo_form.dart';
import 'package:redux_logging_example/widgets/todo/todo_list.dart';

class TodoPage extends StatefulWidget {
  static String route = "/todo";

  TodoPage({Key key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            TodoForm(),
            TodoList(),
          ],
        ),
      ),
    );
  }
}
