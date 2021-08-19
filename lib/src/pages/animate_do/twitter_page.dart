import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            this.active = true;
          });
        },
        child: FaIcon(
          FontAwesomeIcons.play,
        ),
      ),
      body: Center(
        child: ZoomOut(
            animate: this.active,
            from: 40,
            duration: Duration(milliseconds: 1200),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              size: 40,
              color: Colors.white,
            )),
      ),
    );
  }
}
