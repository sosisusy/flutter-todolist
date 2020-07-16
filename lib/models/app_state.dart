import 'package:redux_logging_example/models/todo.dart';

class AppState {
  Todos todos;

  AppState({this.todos});
  factory AppState.initialize() => AppState(
        todos: Todos.initialize(),
      );
  factory AppState.fromJSON(Map<String, dynamic> json) => AppState(
        todos: json["todos"],
      );

  Map<String, dynamic> toJson() => {
        "todos": todos,
      };
}
