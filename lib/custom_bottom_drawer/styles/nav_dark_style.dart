import 'package:flutter/material.dart';

import '../models/nav_style_model.dart';

final NavStyleModel navDarkStyle =
NavStyleModel(

  backgroundColor: const Color(0xFF1E1E1E),

  activeColor: Colors.cyanAccent,

  inactiveColor: Colors.white54,

  indicatorColor: Colors.cyanAccent.withOpacity(0.15),

  borderRadius: BorderRadius.circular(20),

  boxShadow: const [

    BoxShadow(
      color: Colors.black38,
      blurRadius: 25,
    ),

  ],
);