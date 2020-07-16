import 'package:redux_logging_example/models/app_state.dart';
import 'package:redux_logging_example/reducers/todo_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      todos: todoReducer(state.todos, action),
    );
