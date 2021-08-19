import 'package:designs/src/theme/theme_provider.dart';
import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ShowMenuProvider(),
      child: Scaffold(
          body: Stack(
        children: [
          PinterestGrid(),
          _DrawMenu(),
        ],
      )),
    );
  }
}

class _DrawMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('Icon: pie_chart');
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('Icon: search');
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print('Icon: notifications');
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('Icon: supervised_user_circle');
        },
        icon: Icons.supervised_user_circle)
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final showMenu = Provider.of<_ShowMenuProvider>(context).showMenu;
    final themeProvider = Provider.of<ThemeProvider>(context);
    double width = size.width;
    if (width > 500) {
      width = width - 300;
    }

    return Positioned(
        bottom: 15.0,
        child: Container(
          width: width,
          child: Row(
            children: [
              Spacer(),
              PinterestMenu(
                items: this.items,
                showMenu: showMenu,
                backgroundColor:
                    themeProvider.currentTheme.scaffoldBackgroundColor,
                primaryColor: themeProvider.currentTheme.accentColor,
                //secondaryColor: Colors.grey,
              ),
              Spacer(),
            ],
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController _controller = new ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > this.lastScroll && _controller.offset > 100.0) {
        Provider.of<_ShowMenuProvider>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_ShowMenuProvider>(context, listen: false).showMenu = true;
      }
      this.lastScroll = _controller.offset;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    final size = MediaQuery.of(context).size;
    if (size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return new StaggeredGridView.countBuilder(
      controller: _controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Colors.blue,
        ),
        margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _ShowMenuProvider with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => this._showMenu;
  set showMenu(bool show) {
    this._showMenu = show;
    notifyListeners();
  }
}
