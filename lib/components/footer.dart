import 'package:flutter/material.dart'
    show BuildContext, Container, Row, StatelessWidget, Widget;
import 'package:flutter_todo_list/containers/filter_link.dart' show FilterLink;
import 'package:flutter_todo_list/models.dart' show VisibilityFilter;

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          children: <Widget>[
            FilterLink(
              text: 'All',
              filter: VisibilityFilter.SHOW_ALL,
            ),
            FilterLink(
              text: 'Active',
              filter: VisibilityFilter.SHOW_ACTIVE,
            ),
            FilterLink(
              text: 'Completed',
              filter: VisibilityFilter.SHOW_COMPLETED,
            )
          ],
        ),
      );
}
