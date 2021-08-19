import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyIconHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color1, color2;

  EmergencyIconHeader(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.color1 = Colors.blue,
      this.color2 = Colors.lightBlue});

  @override
  Widget build(BuildContext context) {
    Color whiteColor = Colors.white.withOpacity(0.75);
    return Stack(
      children: [
        _HeaderBackground(this.color1, this.color2),
        Positioned(
            top: -65,
            left: -50,
            child: FaIcon(
              this.icon,
              size: 220.0,
              color: Colors.white.withOpacity(0.22),
            )),
        Column(
          children: [
            SizedBox(
              height: 50.0,
              width:
                  double.infinity, //para que todo se acomode segun este ancho
            ),
            Text(
              this.subtitle,
              style: TextStyle(fontSize: 20.0, color: whiteColor),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25.0,
                  color: whiteColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            FaIcon(
              this.icon,
              size: 80.0,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final Color color1, color2;
  _HeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(85.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.color1,
                this.color2
                //Color(0xff526BF6),
                //Color(0xff67ACF2),
              ])),
    );
  }
}
