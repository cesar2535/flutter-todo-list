import 'package:flutter/material.dart'
    show
        BuildContext,
        InputDecoration,
        State,
        StatefulWidget,
        TextEditingController,
        TextField,
        Widget,
        required;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:flutter_todo_list/models.dart'
    show AddTodoPressedFunction, TodoState;
import 'package:flutter_todo_list/redux/actions.dart' show AddTodoAction;

class _ViewModel {
  final AddTodoPressedFunction onAddPressed;

  _ViewModel({
    @required this.onAddPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => StoreConnector<TodoState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel(
              onAddPressed: (todoText) => store.dispatch(
                    AddTodoAction(text: todoText),
                  ),
            ),
        builder: (context, viewModel) => TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Add todo"),
              onSubmitted: (todoText) {
                viewModel.onAddPressed(todoText);
                _controller.text = "";
              },
            ),
      );
}

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}
