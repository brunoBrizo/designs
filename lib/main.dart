import 'package:designs/src/pages/menu_main_page.dart';
import 'package:designs/src/providers/layout_provider.dart';
import 'package:designs/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ThemeProvider(2)),
        ChangeNotifierProvider(
            create: (BuildContext context) => LayoutProvider())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      title: 'Designs App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          print('orientation: $orientation');
          final size = MediaQuery.of(context).size;
          if (size.width > 500) {
            return MenuMainScreen();
          } else {
            return MenuMainScreen();
          }
        },
      ),
    );
  }
}
