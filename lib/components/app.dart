import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        Container,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:flutter_todo_list/components/footer.dart' show Footer;
import 'package:flutter_todo_list/containers/add_todo.dart' show AddTodo;
import 'package:flutter_todo_list/containers/visible_todo_list.dart'
    show VisibleTodoList;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext contenxt) => Scaffold(
        appBar: AppBar(
          title: const Text("Flutter todo"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              AddTodo(),
              VisibleTodoList(),
              Footer(),
            ],
          ),
        ),
      );
}
