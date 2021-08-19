import 'package:designs/src/providers/layout_provider.dart';
import 'package:designs/src/routes/routes.dart';
import 'package:designs/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    final layoutProvider = Provider.of<LayoutProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: currentTheme.currentTheme.accentColor,
          title: Text('Designs in Flutter - Tablet'),
        ),
        drawer: _MainMenu(),
        body: Row(
          children: [
            Container(
              width: 300,
              height: double.infinity,
              child: _OptionsList(),
            ),
            Container(
              width: 1.0,
              height: double.infinity,
              color: (currentTheme.darkTheme)
                  ? Colors.grey
                  : currentTheme.currentTheme.accentColor,
            ),
            Expanded(
              child: layoutProvider.currentPage,
            )
          ],
        ));
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    final layoutProvider = Provider.of<LayoutProvider>(context);

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
          layoutProvider.currentPage = pageRoutes[index].page;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => pageRoutes[index].page));
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
