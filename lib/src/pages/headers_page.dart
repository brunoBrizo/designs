import 'package:designs/src/theme/theme_provider.dart';
import 'package:designs/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: HeaderWavesGradient(
      color: themeProvider.currentTheme.accentColor,
    )));
  }
}
