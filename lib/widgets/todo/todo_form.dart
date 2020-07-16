import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging_example/actions/todo_action.dart';
import 'package:redux_logging_example/models/app_state.dart';
import "package:redux/redux.dart";

class TodoForm extends StatefulWidget {
  const TodoForm({Key key}) : super(key: key);

  @override
  _TodoForm createState() => _TodoForm();
}

class _TodoForm extends State<TodoForm> {
  TextEditingController todoController;
  FocusNode todoFocus;

  @override
  void initState() {
    todoController = TextEditingController();
    todoFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    todoFocus.dispose();
    super.dispose();
  }

  void _handleAddButtonTap(Store<AppState> store) {
    store.dispatch(AddTodoAction(body: todoController.text));
    todoController.clear();
    todoFocus.nextFocus();
  }

  // 투두 아이템 추가 버튼
  Widget _todoButton(VoidCallback callback) {
    return RaisedButton(
      child: Icon(Icons.add),
      onPressed: callback,
    );
  }

  // 투두 입력 필드
  Widget _todoText(VoidCallback callback) {
    return Expanded(
      child: TextField(
        controller: todoController,
        focusNode: todoFocus,
        onSubmitted: (value) => callback(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () => _handleAddButtonTap(store);
      },
      builder: (context, callback) => Row(
        children: [
          _todoText(callback),
          _todoButton(callback),
        ],
      ),
    );
    ;
  }
}
