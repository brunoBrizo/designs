import 'package:animate_do/animate_do.dart';
import 'package:designs/src/widgets/emergency_header.dart';
import 'package:designs/src/widgets/emergency_option_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLarge;
    if (size.height > 550)
      isLarge = true;
    else
      isLarge = false;

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];
    List<Widget> itemsMap = items
        .map((i) => FadeInLeft(
              duration: Duration(milliseconds: 1100),
              child: EmergencyOptionButton(
                title: i.texto,
                onPress: () {},
                icon: i.icon,
                color1: i.color1,
                color2: i.color2,
              ),
            ))
        .toList();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: (isLarge) ? 200.0 : 10.0),
              child: SafeArea(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (isLarge)
                      SizedBox(
                        height: 70.0,
                      ),
                    ...itemsMap
                  ],
                ),
              ),
            ),
            if (isLarge) PageHeader(),
          ],
        ));
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EmergencyIconHeader(
          title: 'Asistencia Médica',
          subtitle: 'Has solicitado',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
          icon: FontAwesomeIcons.plus,
        ),
        Positioned(
            right: 0,
            top: 30,
            child: RawMaterialButton(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15.0),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ),
                onPressed: () {}))
      ],
    );
  }
}
