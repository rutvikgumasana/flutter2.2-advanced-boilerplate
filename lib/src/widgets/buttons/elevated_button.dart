import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  SecondaryButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: MediaQuery.of(context).size.width / 1.10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          primary: Colors.blue,
          onSurface: Colors.red,
          fixedSize: Size(180, 48),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(
          title.toString(),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondaryButtonWithIcon extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  Icon icon;

  SecondaryButtonWithIcon({
    Key? key,
    this.title,
    required this.onPressed,
    this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width / 1.10,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          title.toString(),
        ),
      ),
    );
  }
}
