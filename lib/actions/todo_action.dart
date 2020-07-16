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
