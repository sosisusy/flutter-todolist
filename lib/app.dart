import 'package:flutter/material.dart';
import 'package:redux_logging_example/pages/todo_page.dart';
import 'package:redux_logging_example/routes.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TodoPage.route,
      routes: routes,
    );
  }
}
