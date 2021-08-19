import 'package:designs/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: -5, right: 0, child: _NewListButton())
      ],
    ));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScrollView(
      slivers: [
        /*      SliverAppBar(
          floating: true,
          elevation: 0.0,
          backgroundColor: Colors.red,
          title: Text('fdsfsfd'),
        ),*/

        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 170.0,
                maxHeight: 190.0,
                child: Container(
                    alignment: Alignment.centerLeft,
                    color: themeProvider.currentTheme.scaffoldBackgroundColor,
                    child: _SliverListHeader()))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100.0,
          )
        ]))
      ],
    );
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: size.width * 0.9,
      height: 80.0,
      child: ButtonTheme(
          //  minWidth: size.width * 0.9,
          child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all((themeProvider.darkTheme)
                ? themeProvider.currentTheme.accentColor
                : Color(0xFFED6762)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(50.0))))),
        onPressed: () {},
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: themeProvider.currentTheme.backgroundColor),
        ),
      )),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight ||
        this.minHeight != oldDelegate.minHeight ||
        this.child != oldDelegate.child;
  }
}

class _SliverListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 30.0,
          width: double.infinity,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(
            'New',
            style: TextStyle(
                color:
                    (themeProvider.darkTheme) ? Colors.grey : Color(0xff532128),
                fontSize: 50.0),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100.0,
            ),
            Positioned(
                bottom: 8,
                child: Container(
                  width: 150.0,
                  height: 8.0,
                  color: (themeProvider.darkTheme)
                      ? Colors.grey
                      : Color(0xffF7CDD5),
                )),
            Container(
              child: Text(
                'List',
                style: TextStyle(color: Color(0xffD93A30), fontSize: 50.0),
              ),
            )
          ],
        )
      ],
    );
  }
}

// ignore: unused_element
class _TaskList extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 125.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        this.title,
        style: TextStyle(
            fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
