import 'package:collection/collection.dart' show ListEquality;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget, required;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:flutter_todo_list/components/todo_list.dart' show TodoList;
import 'package:flutter_todo_list/models.dart'
    show Todo, TodoState, TodoTapFunction, VisibilityFilter;
import 'package:flutter_todo_list/redux/actions.dart' show ToggleTodoAction;

class _ViewModel {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  _ViewModel({
    @required this.todos,
    @required this.onTodoTap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          ListEquality<Todo>().equals(todos, other.todos);

  @override
  int get hashCode => todos.hashCode;
}

class VisibleTodoList extends StatelessWidget {
  List<Todo> _getVisibleTodos(List<Todo> todos, VisibilityFilter filter) {
    switch (filter) {
      case VisibilityFilter.SHOW_ALL:
        return todos;
      case VisibilityFilter.SHOW_COMPLETED:
        return todos.where((todo) => todo.completed).toList();
      case VisibilityFilter.SHOW_ACTIVE:
        return todos.where((todo) => !todo.completed).toList();
      default:
        return <Todo>[];
    }
  }

  @override
  Widget build(BuildContext context) => StoreConnector<TodoState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel(
              todos: _getVisibleTodos(
                  store.state.todos, store.state.visibilityFilter),
              onTodoTap: (id) => store.dispatch(
                    ToggleTodoAction(id: id),
                  ),
            ),
        builder: (context, viewModel) => TodoList(
              todos: viewModel.todos,
              onTodoTap: viewModel.onTodoTap,
            ),
      );
}
