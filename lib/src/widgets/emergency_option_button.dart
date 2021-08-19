import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color1, color2;
  final Function onPress;

  EmergencyOptionButton(
      {this.icon = FontAwesomeIcons.personBooth,
      required this.title,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onPress();
      },
      child: Stack(
        children: [
          _OptionButtonBackground(
              this.color1, this.color2, this.onPress, this.icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 135.0,
                width: 40.0,
              ),
              FaIcon(
                this.icon,
                size: 40.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                  this.title,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 30.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 40.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OptionButtonBackground extends StatelessWidget {
  final Color color1, color2;
  final Function onPress;
  final IconData icon;

  _OptionButtonBackground(this.color1, this.color2, this.onPress, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  this.icon,
                  size: 150.0,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
                offset: Offset(4, 6))
          ],
          gradient: LinearGradient(colors: <Color>[
            this.color1,
            this.color2
            //Color(0xff6989F5),
            //Color(0xff906EF5)
          ])),
    );
  }
}
