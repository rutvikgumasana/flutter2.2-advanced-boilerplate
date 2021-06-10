import 'package:flutter/material.dart';
import 'package:pvr_customer_app/src/style/colors.dart';

// ignore: must_be_immutable
class OutlineButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  VoidCallback? onLongPress;
  double? height;
  double? width;
  double? radius;
  double? fontSize;
  Color? color;
  Color? textColor;
  Color? borderColor;
  ButtonTextTheme? textTheme;

  OutlineButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.color,
    this.fontSize,
    this.radius,
    this.textColor,
    this.borderColor,
    this.onLongPress,
    this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title.toString(),
        ),
      ),
    );
  }
}

class OutlineIconButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  Icon icon;

  OutlineIconButton({
    Key? key,
    this.color,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
      label: Text(title.toString()),
      icon: icon,
      onPressed: onPressed,
    );
  }
}
