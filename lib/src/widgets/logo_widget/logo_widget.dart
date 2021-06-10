import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(60, 70, 60, 0),
      child: Image(
        image: AssetImage(
          "assets/image/logo-final.png",
        ),
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width / 1.5,
        // height: 2,
        alignment: Alignment.center,
      ),
    );
  }
}
