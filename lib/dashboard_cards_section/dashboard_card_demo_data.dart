import 'package:flutter/material.dart';

import 'dashboard_card_model.dart';

class DashboardCardDemoData {

  static List<DashboardCardModel> cards = [

    DashboardCardModel(
      title: "TOTAL VISITS",
      count: "120",
      subtitle: "100% of Total",
      color: Colors.blue,
      icon: Icons.groups_rounded,
    ),

    DashboardCardModel(
      title: "INTERESTED",
      count: "45",
      subtitle: "37.50% of Total",
      color: Colors.green,
      icon: Icons.thumb_up_alt_rounded,
    ),

    DashboardCardModel(
      title: "FOLLOW-UP",
      count: "50",
      subtitle: "41.67% of Total",
      color: Colors.orange,
      icon: Icons.access_time_filled_rounded,
    ),

    DashboardCardModel(
      title: "NOT INTERESTED",
      count: "25",
      subtitle: "20.83% of Total",
      color: Colors.red,
      icon: Icons.cancel_rounded,
    ),

    DashboardCardModel(
      title: "ATTENDED BY",
      count: "8",
      subtitle: "Team Members",
      color: Colors.deepPurple,
      icon: Icons.groups_2_rounded,
    ),
  ];
}