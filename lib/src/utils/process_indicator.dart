import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'internet_error.dart';

class Circle {
  static final _instance = new Circle.internal();
  factory Circle() => _instance;
  Circle.internal();

  static bool entry = false;
  static OverlayEntry viewEntry =
      new OverlayEntry(builder: (BuildContext context) {
    return ProcessIndicator();
  });

  InternetError internetError = new InternetError();

  show(context) async {
    return addOverlayEntry(context);
  }

  void hide(context) => removeOverlay();

  bool get isShow => isShowNetworkOrCircle();

  bool isShowNetworkOrCircle() {
    return internetError.isShow || entry == true;
  }

  addOverlayEntry(context) async {
    if (entry == true) return;
    entry = true;
    return addOverlay(viewEntry, context);
  }

  addOverlay(OverlayEntry entry, context) async {
    try {
      return Overlay.of(context)!.insert(entry);
    } catch (e) {
      return Future.error(e);
    }
  }

  removeOverlay() async {
    try {
      entry = false;
      viewEntry.remove();
    } catch (e) {
      return Future.error(e);
    }
  }
}

class ProcessIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Material(
    //   color: Colors.transparent,
    //   child: Align(
    //     alignment: Alignment.center,
    //     child: Material(
    //       color: Colors.transparent,
    //       child: Container(
    //         height: 70,
    //         width: 80,
    //         decoration: BoxDecoration(
    //           color: primaryBlack.withOpacity(0.9),
    //         ),
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             TextAndStyle(
    //               title: "Loading",
    //               textAlign: TextAlign.center,
    //               color: whiteColor,
    //               fontSize: 8,
    //             ),
    //             SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: TweenAnimationBuilder<double>(
    //                 tween: Tween<double>(begin: 0.0, end: 1),
    //                 duration: const Duration(milliseconds: 3500),
    //                 builder: (context, value, _) => CircularProgressIndicator(
    //                   valueColor:
    //                       AlwaysStoppedAnimation<Color>(Color(0xFF164396)),
    //                   backgroundColor: Color(0xFF0895F3),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            child: Lottie.asset(
              'assets/json/final_loader.json',
              height: 70,
              width: 70,
            ),
          ),
        ),
      ),
    );
  }
}
