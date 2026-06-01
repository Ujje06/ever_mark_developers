import 'package:flutter/material.dart';

class NavStyleModel {

  final Color backgroundColor;

  final Color activeColor;

  final Color inactiveColor;

  final Color indicatorColor;

  final List<BoxShadow> boxShadow;

  final BorderRadius borderRadius;

  const NavStyleModel({

    required this.backgroundColor,

    required this.activeColor,

    required this.inactiveColor,

    required this.indicatorColor,

    required this.boxShadow,

    required this.borderRadius,

  });
}