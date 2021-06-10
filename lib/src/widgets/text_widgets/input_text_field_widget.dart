import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pvr_customer_app/src/style/colors.dart';
import 'package:pvr_customer_app/src/utils/validator.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    this.fieldKey,
    this.hintText,
    this.style,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.enabled,
    this.focusNode,
  });
  final Key? fieldKey;
  final String? hintText;
  final TextStyle? style;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      hintText: hintText,
      enabled: enabled,
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validators.validateEmail(value!.trim()),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  PasswordWidget({
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.validator,
    this.controller,
    this.focusNode,
    this.textInputAction,
  });

  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: widget.fieldKey,
      hintText: widget.hintText,
      focusNode: widget.focusNode,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      validator: widget.validator ??
          (value) => Validators.validatePassword(value!.trim()),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    this.fieldKey,
    this.hintText,
    this.validator,
    this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.keyboardType,
    this.fillColor,
  });

  final Key? fieldKey;
  final String? hintText;
  final List<TextInputFormatter?>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: keyboardType,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      controller: controller,
      style: style,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      textInputAction: textInputAction,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    this.fieldKey,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textAlign = TextAlign.left,
  });

  final Key? fieldKey;
  final String? hintText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    this.fieldKey,
    this.hintText,
    this.validator,
    this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.filledColor,
  });

  final Key? fieldKey;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: TextInputType.text,
      focusNode: focusNode,
      fieldKey: fieldKey,
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      hintText: hintText,
      filledColor: filledColor,
    );
  }
}

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final Function(String?)? onChanged;
  TextEditingController? controller;

  SearchBar({
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormFieldWidget(
        hintText: "Find friend here",
        controller: controller,
        onChanged: onChanged,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}

TextFormField textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: primaryBlack,
    cursorHeight: 20,
    style: style,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      errorMaxLines: 5,
      fillColor: filledColor,
      filled: true,
      hintStyle: hintStyle,
      hintText: hintText,
      counterText: "",
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}
