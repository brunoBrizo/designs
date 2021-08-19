import 'package:designs/src/theme/theme_provider.dart';
import 'package:designs/src/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLarge;
    if (size.height > 500)
      isLarge = true;
    else
      isLarge = false;

    final children = <Widget>[
      Expanded(child: MiSlideShows()),
      Expanded(child: MiSlideShows()),
    ];
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: (isLarge)
            ? Column(
                children: children,
              )
            : Row(children: children));
  }
}

class MiSlideShows extends StatelessWidget {
  const MiSlideShows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SlideShow(
      bulletPrimario: 18.0,
      bulletSecundario: 12.0,
      colorPrimario: (themeProvider.darkTheme)
          ? themeProvider.currentTheme.accentColor
          : Color(0xffFF5A7E),
      //dotsUp: true,
      //primaryColor: Colors.grey.shade800,
      //secondaryColor: Colors.white,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg')
      ],
    );
  }
}
