import 'package:flutter/material.dart';

// INFO: can try import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopScreen;
  final Widget mobileScreen;

  const ResponsiveLayout(
      {Key? key, required this.desktopScreen, required this.mobileScreen})
      : super(key: key);

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constriants) {
      if (constriants.maxWidth < 600) {
        return mobileScreen;
      } else {
        return desktopScreen;
      }
    });
  }
}
