import 'package:flutter/material.dart';
import 'package:pvr_customer_app/src/style/colors.dart';

// ignore: must_be_immutable
class CircularCheckboxWidget extends StatefulWidget {
  bool value;
  VoidCallback onChanged;
  CircularCheckboxWidget({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CircularCheckboxWidgetState createState() => _CircularCheckboxWidgetState();
}

class _CircularCheckboxWidgetState extends State<CircularCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged,
      child: SizedBox(
        height: 25,
        width: 25,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.value ? primaryWhite : Colors.green[50],
            border: Border.all(
              width: 1.8,
              color: primaryBlack,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryBlack, blurRadius: 5,
                spreadRadius: .5, //extend the shadow
              )
            ],
            shape: BoxShape.circle,
          ),
          child: widget.value
              ? Icon(
                  Icons.check_rounded,
                  size: 20,
                  color: primaryWhite,
                )
              : Icon(
                  Icons.circle,
                  size: 20,
                  color: Colors.green[50],
                ),
        ),
      ),
    );
  }
}
