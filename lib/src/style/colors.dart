// 11184E

import 'package:flutter/material.dart';
import 'dart:ui';

Map<String, Color> colorStyles = {
  'primary': Colors.blue,
  'ligth_font': Colors.black54,
  'gray': Colors.black45,
  'white': Colors.white
};

final bgBlueColor = const Color(0xff11184E);
final boxBlueColor = const Color(0xff262F70);

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _whitePrimaryValue = 0xFFFFFFFF;

const int _scaffoldValue = 0xFFFAFAFA;
const MaterialColor scaffoldColor = MaterialColor(
  _scaffoldValue,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFFAFAFA),
    200: Color(0xFFFAFAFA),
    300: Color(0xFFFAFAFA),
    400: Color(0xFFFAFAFA),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFAFAFA),
    700: Color(0xFFFAFAFA),
    800: Color(0xFFFAFAFA),
    900: Color(0xFFFAFAFA),
  },
);
