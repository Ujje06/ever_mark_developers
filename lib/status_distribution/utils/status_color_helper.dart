import 'package:flutter/material.dart';

class StatusColorHelper {

  static Color getStatusColor(
      String status,
      ) {

    switch (status.toLowerCase()) {

      case "interested":
        return Colors.green;

      case "follow-up":
        return Colors.orange;

      case "not interested":
        return Colors.red;

      case "closed":
        return Colors.blue;

      case "pending":
        return Colors.purple;

      default:
        return Colors.grey;
    }
  }
}