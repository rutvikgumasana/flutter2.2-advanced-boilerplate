import 'package:flutter/material.dart';

// Package imports:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TimepickerWidget extends StatefulWidget {
  const TimepickerWidget({
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.filled,
    this.decoration,
    this.enabled,
    this.validator,
    this.hintStyle,
    this.hintText,
    this.textStyle,
    this.onOpenTimePicker,
    this.currentTime,
    this.fillColor,
  });
  final String? labelText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool? filled;
  final InputDecoration? decoration;
  final bool? enabled;

  final FormFieldValidator? validator;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? textStyle;
  final Function? onOpenTimePicker;
  final DateTime? currentTime;
  final Color? fillColor;
  @override
  _TimepickerWidgetState createState() => _TimepickerWidgetState();
}

class _TimepickerWidgetState extends State<TimepickerWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return DateTimeField(
          style: widget.textStyle,
          textAlign: TextAlign.center,
          enabled: widget.enabled ?? true,
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            fillColor: widget.fillColor,
            filled: true,
            hintStyle: widget.hintStyle,
            hintText: widget.hintText,
          ),
          keyboardType: TextInputType.datetime,
          format: DateFormat("HH:mm", 'en_US'),
          resetIcon: null,
          onShowPicker: (context, currentValue) async {
            final selectedTime = await DatePicker.showPicker(
              context,
              theme: DatePickerTheme(
                containerHeight: 200.0,
                itemHeight: 40,
              ),
              showTitleActions: true,
              pickerModel: CustomPicker(
                currentTime: widget.currentTime,
              ),
              locale: LocaleType.en,
              onChanged: (time) {},
              onConfirm: (time) {
                setState(() {});
              },
            );
            if (selectedTime != null) {
              // ignore: unnecessary_null_comparison
              int hour = selectedTime.hour != null
                  ? selectedTime.hour
                  : DateTime.now().hour;
              TimeOfDay pickedTime = TimeOfDay(hour: hour, minute: 00);
              setState(() {});
              return DateTimeField.convert(pickedTime);
            } else {}
          },
        );
      },
    );
  }
}

class CustomPicker extends TimePickerModel {
  CustomPicker({
    DateTime? currentTime,
  }) : super(locale: LocaleType.en) {
    this.currentTime = currentTime ?? DateTime.now();
    this.showSecondsColumn = false;
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(0);
    this.setRightIndex(0);
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 1) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }
}
