import 'package:flutter/cupertino.dart';
import 'package:redux_logging_example/pages/intro_page.dart';
import 'package:redux_logging_example/pages/todo_page.dart';

Map<String, WidgetBuilder> routes = {
  IntroPage.route: (context) => IntroPage(),
  TodoPage.route: (context) => TodoPage(),
};
