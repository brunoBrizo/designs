import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.showMenu = true,
      this.primaryColor = Colors.blue,
      this.backgroundColor = Colors.white,
      required this.items,
      this.secondaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    List<PinterestButton> items = [
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

    return ChangeNotifierProvider(
        create: (_) => new _MenuProvider(),
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: (showMenu) ? 1 : 0,
            child: Builder(builder: (BuildContext context) {
              Provider.of<_MenuProvider>(context).backgroundColor =
                  this.backgroundColor;
              Provider.of<_MenuProvider>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_MenuProvider>(context).secondaryColor =
                  this.secondaryColor;

              return _MenuBackground(
                child: _MenuItems(items),
              );
            })));
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuProvider>(context).backgroundColor;

    return Container(
      child: this.child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 9.0, spreadRadius: -5)
          ]),
    );
  }
}

class PinterestButton {
  final void Function()? onPressed;
  final IconData? icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            items.length, (index) => _MenuItem(index, items[index])));
  }
}

class _MenuItem extends StatelessWidget {
  final int index;
  final PinterestButton button;

  _MenuItem(this.index, this.button);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuProvider>(context);
    final iconSize;
    final iconColor;

    if (this.index == menuProvider.selectedItem) {
      iconSize = 33.0;
      iconColor = menuProvider.primaryColor;
    } else {
      iconSize = 25.0;
      iconColor = menuProvider.secondaryColor;
    }

    return GestureDetector(
        onTap: () {
          Provider.of<_MenuProvider>(context, listen: false).selectedItem =
              this.index;
          button.onPressed!();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Icon(
            button.icon,
            size: iconSize,
            color: iconColor,
          ),
        ));
  }
}

//PROVIDER
class _MenuProvider with ChangeNotifier {
  int _selectedItem = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  Color _backgroundColor = Colors.white;

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color color) {
    this._backgroundColor = color;
  }

  int get selectedItem => this._selectedItem;
  set selectedItem(int item) {
    this._selectedItem = item;
    notifyListeners();
  }
}
