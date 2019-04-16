import 'package:flutter_todo_list/models.dart'
    show Todo, TodoState, VisibilityFilter;
import 'package:flutter_todo_list/redux/actions.dart'
    show AddTodoAction, SetVisibilityFilterAction, TodoAction, ToggleTodoAction;

List<Todo> todoReducer(List<Todo> state, TodoAction action) {
  if (action is AddTodoAction) {
    return <Todo>[]
      ..addAll(state)
      ..add(Todo(id: action.id, text: action.text));
  }

  if (action is ToggleTodoAction) {
    return state
        .map((Todo todo) => todo.id == action.id
            ? todo.copyWith(completed: !todo.completed)
            : todo)
        .toList();
  }

  return state;
}

VisibilityFilter visibilityFilterReducer(
    VisibilityFilter state, TodoAction action) {
  if (action is SetVisibilityFilterAction) {
    return action.filter;
  }

  return state;
}

TodoState todoAppReducer(TodoState state, action) {
  return TodoState(
    todos: todoReducer(state.todos, action),
    visibilityFilter: visibilityFilterReducer(state.visibilityFilter, action),
  );
}
