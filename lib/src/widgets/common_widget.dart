import 'package:flutter/material.dart';
import 'package:pvr_customer_app/src/style/colors.dart';

class CommonWidget extends StatelessWidget {
  Widget horizontalDivider() {
    return Divider(
      color: primaryBlack,
    );
  }

  Widget customHorizontalDivider() {
    return Container(
      color: primaryBlack,
      height: 1,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class CommonMethod extends StatefulWidget {
  redirectAndRemoveUntil({required BuildContext context, className}) {
    print("PUSH AND REMOVE UNTIL Redirect to screen : $className");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => className,
        ),
        (route) => false);
  }

  void redirectToScreen({required BuildContext context, className}) {
    print("PUSH Redirect to screen : $className");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return className;
        },
      ),
    );
  }

  void redirectAndReplacement({required BuildContext context, className}) {
    print("PUSH REPLACEMENT Redirect to screen : $className");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => className),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
