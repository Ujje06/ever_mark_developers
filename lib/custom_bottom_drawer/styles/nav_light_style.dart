import 'package:flutter/material.dart';

import '../models/nav_style_model.dart';

final NavStyleModel navLightStyle =
NavStyleModel(

  backgroundColor: Colors.white,

  activeColor: Colors.blue,

  inactiveColor: Colors.grey,

  indicatorColor: Colors.blue.withOpacity(0.1),

  borderRadius: BorderRadius.circular(20),

  boxShadow: const [

    BoxShadow(
      color: Colors.black12,
      blurRadius: 20,
    ),

  ],
);