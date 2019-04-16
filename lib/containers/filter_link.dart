import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, VoidCallback, Widget, required;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:flutter_todo_list/components/link.dart' show Link;
import 'package:flutter_todo_list/models.dart' show TodoState, VisibilityFilter;
import 'package:flutter_todo_list/redux/actions.dart' show SetVisibilityFilterAction;

class _ViewModel {
  final bool active;
  final VoidCallback onPressed;

  _ViewModel({
    @required this.active,
    @required this.onPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          active == other.active;

  @override
  int get hashCode => active.hashCode;
}

class FilterLink extends StatelessWidget {
  final VisibilityFilter filter;
  final String text;

  FilterLink({@required this.filter, @required this.text});

  @override
  Widget build(BuildContext context) => StoreConnector<TodoState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel(
              active: filter == store.state.visibilityFilter,
              onPressed: () => store.dispatch(
                    SetVisibilityFilterAction(filter: filter),
                  ),
            ),
        builder: (context, viewModel) => Link(
              active: viewModel.active,
              text: text,
              onPressed: viewModel.onPressed,
            ),
      );
}
