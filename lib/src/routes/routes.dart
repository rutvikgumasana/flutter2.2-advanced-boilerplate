import 'package:flutter/widgets.dart';

import '../../splash_screen.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => SplashScreen(),
  // MainHomeScreen.routeName: (ctx) => MainHomeScreen(),
};
