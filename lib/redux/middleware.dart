import 'dart:async' show Future;
import 'package:redux/redux.dart'
    show Middleware, NextDispatcher, Store, TypedMiddleware;
import 'package:flutter_todo_list/models.dart' show TodoState;
import 'package:flutter_todo_list/redux/actions.dart' show TodoAction;

List<Middleware<TodoState>> createMiddleware() =>
    [TypedMiddleware<TodoState, TodoAction>(_saveList)];

Future _saveList(
    Store<TodoState> store, TodoAction action, NextDispatcher next) async {
  await Future.sync(() => Duration(seconds: 3));
  next(action);
}
