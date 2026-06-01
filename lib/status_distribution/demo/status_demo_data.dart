import 'package:flutter/material.dart';

import '../model/status_data.dart';

class StatusDemoData {

  static List<StatusData> items = [

    const StatusData(

      label: "Interested",

      value: 45,

      color: Colors.green,
    ),

    const StatusData(

      label: "Follow-Up",

      value: 50,

      color: Colors.orange,
    ),

    const StatusData(

      label: "Not Interested",

      value: 25,

      color: Colors.red,
    ),

    const StatusData(

      label: "Closed",

      value: 18,

      color: Colors.blue,
    ),
  ];
}