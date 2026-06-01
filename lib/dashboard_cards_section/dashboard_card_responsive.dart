import 'package:flutter/material.dart';

class DashboardCardResponsive {

  static double padding(double width) {
    return width * 0.05;
  }

  static double borderRadius(double width) {
    return width * 0.06;
  }

  static double iconContainerSize(double width) {
    return width * 0.18;
  }

  static double iconSize(double width) {
    return iconContainerSize(width) * 0.52;
  }

  static double titleFont(double width) {

    if (isMobile(width)) {
      return width * 0.050;
    }

    if (isTablet(width)) {
      return width * 0.032;
    }

    return width * 0.020;
  }

  static double countFont(double width) {

    if (isMobile(width)) {
      return width * 0.110;
    }

    if (isTablet(width)) {
      return width * 0.070;
    }

    return width * 0.040;
  }

  static double subtitleFont(double width) {
    return width * 0.040;
  }

  static double spacing(double height) {
    return height * 0.05;
  }




  static bool isMobile(double width) {
    return width < 600;
  }

  static bool isTablet(double width) {
    return width >= 600 && width < 1024;
  }

  static bool isDesktop(double width) {
    return width >= 1024;
  }
}