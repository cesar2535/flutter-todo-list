import 'package:flutter/material.dart'
    show BuildContext, Column, Key, StatelessWidget, Widget, required;
import 'package:flutter_todo_list/components/todo_item.dart' show TodoItem;
import 'package:flutter_todo_list/models.dart' show Todo, TodoTapFunction;

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  TodoList({@required this.todos, @required this.onTodoTap});

  List<Widget> _buildListItems() => todos
      .map((todo) => TodoItem(
            key: Key(todo.id.toString()),
            todo: todo,
            onTap: onTodoTap,
          ))
      .toList();

  @override
  Widget build(BuildContext context) => Column(
        children: _buildListItems(),
      );
}
