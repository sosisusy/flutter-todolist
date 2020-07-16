import 'dart:convert';
import "dart:developer" as developer;

import 'package:redux/redux.dart';
import 'package:redux_logging_example/models/app_state.dart';

class LoggingMiddleware {
  void appStateLogging(
    Store<AppState> store,
    dynamic action,
    dynamic Function(dynamic) next,
  ) {
    final logName = "app.redux.state";
    final tt = jsonEncode(store.state);
    developer.log("$tt", name: logName);

    next(action);
  }
}
