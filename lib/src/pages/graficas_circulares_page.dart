import 'package:designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCirculares extends StatefulWidget {
  const GraficasCirculares({Key? key}) : super(key: key);

  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
  double porc = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porc += 10;
            if (porc > 100) {
              porc = 0;
            }
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porc: porc,
                  width: 150.0,
                  height: 150.0,
                  primaryColor: Colors.grey,
                  secondaryColor: Colors.blue,
                ),
                CustomRadialProgress(
                  porc: porc * 1.2,
                  width: 120.0,
                  height: 120.0,
                  primaryColor: Colors.red,
                  secondaryColor: Colors.grey,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porc: porc * 1.4,
                  width: 120.0,
                  height: 120.0,
                  primaryColor: Colors.grey,
                  secondaryColor: Colors.blue,
                ),
                CustomRadialProgress(
                  porc: porc * 1.6,
                  width: 150.0,
                  height: 150.0,
                  primaryColor: Colors.red,
                  secondaryColor: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porc;
  final double width;
  final double height;
  final Color primaryColor;
  final Color secondaryColor;

  const CustomRadialProgress({
    required this.porc,
    required this.width,
    required this.height,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    //final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    return Container(
      padding: EdgeInsets.all(10.0),
      width: this.width,
      height: this.height,
      //color: Colors.red,
      child: RadialProgress(
          porc, this.primaryColor, this.secondaryColor, 12.0, 18.0),
    );
  }
}
