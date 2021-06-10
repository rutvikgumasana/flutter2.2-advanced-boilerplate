import 'package:flutter/material.dart';
import 'package:pvr_customer_app/splash_screen.dart';

class PVRCustomerApp extends StatefulWidget {
  // PVRCustomerApp({Key key}) : super(key: key);

  @override
  _PVRCustomerAppState createState() => _PVRCustomerAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _PVRCustomerAppState extends State<PVRCustomerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'PVR Customer App ',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
