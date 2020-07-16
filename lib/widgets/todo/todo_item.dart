import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging_example/actions/todo_action.dart';
import 'package:redux_logging_example/models/app_state.dart';
import 'package:redux_logging_example/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key key,
    this.item,
  }) : super(key: key);

  final TodoDetail item;

  // 체크버튼
  Widget _buildCheckButton() {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(ModifyTodoAction(id: item.id));
      },
      builder: (context, callback) => IconButton(
        icon: Icon(Icons.check),
        color: item.complited ? Colors.lightBlue : Colors.grey,
        onPressed: callback,
      ),
    );
  }

  // 리스트 아이템 버튼 그룹
  Widget _buildTodoItemButtonGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildCheckButton(),
      ],
    );
  }

  // 아이템 텍스트
  Widget _buildTodoItemText() {
    return Text(
      item.body,
      style: TextStyle(
        decoration: item.complited ? TextDecoration.lineThrough : null,
      ),
    );
  }

  // 아이템 드래그 삭제
  Widget _buildDismissible({@required Widget child}) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(RemoveTodoAction(id: item.id));
      },
      builder: (context, callback) => Dismissible(
        key: ValueKey(item),
        onDismissed: (direction) => callback(),
        child: child,
        background: Container(
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDismissible(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTodoItemText(),
            _buildTodoItemButtonGroup(),
          ],
        ),
      ),
    );
  }
}
