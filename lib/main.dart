import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging_example/app.dart';
import "package:redux/redux.dart";
import 'package:redux_logging_example/middleware/logging_middleware.dart';
import 'package:redux_logging_example/models/app_state.dart';
import 'package:redux_logging_example/reducers/app_reducer.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialize(),
    middleware: [
      LoggingMiddleware().appStateLogging,
    ],
  );

  runApp(StoreProvider(store: store, child: App()));
}
