import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging_example/models/app_state.dart';
import 'package:redux_logging_example/models/todo.dart';
import 'package:redux_logging_example/widgets/todo/todo_item.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // 투두 아이템 빌드
  List<Widget> _buildTodoItem(List<TodoDetail> todos) {
    return todos.map((item) => TodoItem(item: item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StoreConnector<AppState, Todos>(
        converter: (store) => store.state.todos,
        builder: (context, todos) {
          List<TodoItem> listItems = _buildTodoItem(todos.items);

          return ListView(
            children: listItems,
          );
        },
      ),
    );
  }
}
