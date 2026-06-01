import 'package:flutter/material.dart';

class DashboardCardModel {

  final String title;
  final String count;
  final String subtitle;
  final Color color;
  final IconData icon;

  const DashboardCardModel({
    required this.title,
    required this.count,
    required this.subtitle,
    required this.color,
    required this.icon,
  });
}