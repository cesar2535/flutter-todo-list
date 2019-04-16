import 'package:flutter/material.dart'
    show
        BuildContext,
        FlatButton,
        StatelessWidget,
        Text,
        Theme,
        VoidCallback,
        Widget,
        required;

class Link extends StatelessWidget {
  final bool active;
  final String text;
  final VoidCallback onPressed;

  Link({@required this.active, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) => FlatButton(
        color: active ? Theme.of(context).primaryColor : null,
        onPressed: onPressed,
        child: Text(text),
      );
}
