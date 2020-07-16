import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging_example/actions/todo_action.dart';
import 'package:redux_logging_example/models/app_state.dart';
import 'package:redux_logging_example/models/todo.dart';
import 'package:redux_logging_example/pages/todo_page.dart';
import 'package:redux_logging_example/services/sqlite.dart';
import 'package:redux/redux.dart';

class IntroPage extends StatefulWidget {
  static String route = "/intro";

  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isLoading = true;

  Future<void> loadTodos(Store<AppState> store) async {
    Todos todos = await SqliteService().getTodos();
    store.dispatch(ResetTodoAction(items: todos));
  }

  Future<void> fetchData(Store<AppState> store) async {
    await loadTodos(store);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) Navigator.pushNamed(context, TodoPage.route);

    return StoreConnector<AppState, void>(
      converter: (store) => fetchData(store),
      builder: (context, vm) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
