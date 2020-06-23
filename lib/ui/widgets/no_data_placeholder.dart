import 'package:flutter/material.dart';

import '../../constants.dart';

class NoDataPlaceholder extends StatelessWidget {
  final String _message;

  NoDataPlaceholder(this._message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/no_data.png'),
          Text(_message, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
