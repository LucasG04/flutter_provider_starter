import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import 'providers/album_provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AlbumProvider>(create: (_) => AlbumProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeRef, _) {
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme), // for dev purposes only
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: themeRef.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            initialRoute: Routes.albums,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
