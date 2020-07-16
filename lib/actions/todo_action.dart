import 'package:redux_logging_example/models/todo.dart';

class AddTodoAction {
  String body;

  AddTodoAction({this.body});
}

class RemoveTodoAction {
  int id;
  RemoveTodoAction({this.id});
}

class ModifyTodoAction {
  int id;
  ModifyTodoAction({this.id});
}

class ResetTodoAction {
  Todos items;
  ResetTodoAction({this.items});
}
