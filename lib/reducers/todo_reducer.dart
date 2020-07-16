import 'package:redux_logging_example/actions/todo_action.dart';
import 'package:redux_logging_example/models/todo.dart';
import 'package:redux/redux.dart';

Todos addTodoReducer(Todos state, AddTodoAction action) {
  TodoDetail todo = TodoDetail(
    id: ++Todos.id,
    body: action.body,
    complited: false,
  );

  return Todos(
    items: List.from(state.items)..add(todo),
  );
}

Todos removeTodoReducer(Todos state, RemoveTodoAction action) {
  return Todos(
    items: List.from(state.items)..removeWhere((e) => e.id == action.id),
  );
}

Todos modifyTodoReducer(Todos state, ModifyTodoAction action) {
  TodoDetail todo = state.items.firstWhere((e) => e.id == action.id);

  todo.complited = !todo.complited;

  return Todos(
    items: List.from(state.items),
  );
}

Reducer<Todos> todoReducer = combineReducers<Todos>([
  TypedReducer<Todos, AddTodoAction>(addTodoReducer),
  TypedReducer<Todos, RemoveTodoAction>(removeTodoReducer),
  TypedReducer<Todos, ModifyTodoAction>(modifyTodoReducer),
]);
