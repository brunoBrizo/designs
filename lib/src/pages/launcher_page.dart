import 'package:designs/src/routes/routes.dart';
import 'package:designs/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentTheme.accentColor,
        title: Text('Designs in Flutter - Mobile'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: currentTheme.primaryColorLight,
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: currentTheme.accentColor,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: currentTheme.accentColor,
        ),
        title: Text(pageRoutes[index].title),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 180.0,
              child: CircleAvatar(
                backgroundColor: themeProvider.currentTheme.accentColor,
                child: Text(
                  'BB',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Expanded(
              child: _OptionsList(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,
                  color: themeProvider.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: themeProvider.darkTheme,
                  activeColor: themeProvider.currentTheme.accentColor,
                  onChanged: (value) {
                    themeProvider.darkTheme = value;
                  }),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen,
                  color: themeProvider.currentTheme.accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: themeProvider.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    themeProvider.customTheme = value;
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
