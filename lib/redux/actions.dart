import 'package:flutter/material.dart' show required;
import 'package:flutter_todo_list/models.dart' show VisibilityFilter;

abstract class TodoAction {
  String toString() => '$runtimeType';
}

class AddTodoAction extends TodoAction {
  static int _id = 0;
  final String text;

  AddTodoAction({@required this.text}) {
    _id++;
  }

  int get id => _id;
}

class SetVisibilityFilterAction extends TodoAction {
  final VisibilityFilter filter;
  SetVisibilityFilterAction({@required this.filter});
}

class ToggleTodoAction extends TodoAction {
  final int id;
  ToggleTodoAction({@required this.id});
}
