import 'package:flutter/material.dart';
import 'package:redux/redux.dart' show Store;
import 'package:flutter_redux/flutter_redux.dart' show StoreProvider;
import 'components/app.dart' show App;
import 'redux/reducers.dart' show todoAppReducer;
import 'redux/middleware.dart' show createMiddleware;
import 'models.dart' show TodoState;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<TodoState> store = Store<TodoState>(
    todoAppReducer,
    initialState: TodoState.initialState(),
    middleware: createMiddleware(),
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'todo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: App(),
        ),
      );
}
