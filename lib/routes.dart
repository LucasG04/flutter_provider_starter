import 'package:flutter/material.dart';

import './ui/screens/albums/albums_screen.dart';

class Routes {
  Routes._();
  static const String albums = '/albums';

  static final routes = <String, WidgetBuilder>{
    albums: (_) => AlbumsScreen(),
  };
}