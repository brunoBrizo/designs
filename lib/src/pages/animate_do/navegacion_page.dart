import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Navegacion Page'),
        ),
        floatingActionButton: _FloatingNavigation(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _FloatingNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);

        int number = notiModel.number;
        number++;

        notiModel.number = number;

        if (number >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(
        FontAwesomeIcons.play,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone),
            label: 'Bones',
            backgroundColor: Colors.pink),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  /*    child: Icon(        Este simula el punto rojo por arriba de la campana
                      Icons.brightness_1,
                      size: 8,
                      color: Colors.red,
                    ),*/
                  child: BounceInDown(
                    animate: (number > 0) ? true : false,
                    from: 13,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      from: 13,
                      child: Container(
                        width: 11.5,
                        height: 11.5,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                          number.toString(),
                          style: TextStyle(fontSize: 7, color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.pink),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog),
            label: 'My Dog',
            backgroundColor: Colors.pink)
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceController;

  int get number => this._number;

  set number(int number) {
    this._number = number;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }
}
