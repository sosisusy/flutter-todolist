import 'package:redux_logging_example/actions/todo_action.dart';
import 'package:redux_logging_example/models/todo.dart';
import 'package:redux/redux.dart';

Todos addTodoReducer(Todos state, AddTodoAction action) {
  TodoDetail todo = TodoDetail(
    id: ++Todos.id,
    body: action.body,
    completed: 0,
  );

  return Todos(
    items: List.from(state.items)..add(todo),
  );
}

Todos removeTodoReducer(Todos state, RemoveTodoAction action) {
  Todos todos = Todos(
    items: List.from(state.items)..removeWhere((e) => e.id == action.id),
  );

  return todos;
}

Todos modifyTodoReducer(Todos state, ModifyTodoAction action) {
  TodoDetail todo = state.items.firstWhere((e) => e.id == action.id);

  todo.completed = todo.completed == 0 ? 1 : 0;

  return Todos(
    items: List.from(state.items),
  );
}

Todos resetTodoReducer(Todos state, ResetTodoAction action) {
  return action.items;
}

Reducer<Todos> todoReducer = combineReducers<Todos>([
  TypedReducer<Todos, AddTodoAction>(addTodoReducer),
  TypedReducer<Todos, RemoveTodoAction>(removeTodoReducer),
  TypedReducer<Todos, ModifyTodoAction>(modifyTodoReducer),
  TypedReducer<Todos, ResetTodoAction>(resetTodoReducer),
]);
