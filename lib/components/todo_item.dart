import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        ListTile,
        StatelessWidget,
        Text,
        TextDecoration,
        TextStyle,
        Widget,
        required;
import 'package:flutter_todo_list/models.dart' show Todo, TodoTapFunction;

class TodoItem extends StatelessWidget {
  final Key key;
  final TodoTapFunction onTap;
  final Todo todo;

  final TextStyle completedTextStyle = TextStyle(
      decoration: TextDecoration.combine([TextDecoration.lineThrough]));

  TodoItem({@required this.key, @required this.onTap, @required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.text, style: todo.completed ? completedTextStyle : null),
      onTap: () => onTap(todo.id),
    );
  }
}
