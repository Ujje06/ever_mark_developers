import 'package:flutter/material.dart';

import '../models/nav_style_model.dart';

final NavStyleModel navGlassStyle =
NavStyleModel(

  backgroundColor: Colors.white.withOpacity(0.15),

  activeColor: Colors.white,

  inactiveColor: Colors.white70,

  indicatorColor: Colors.white.withOpacity(0.1),

  borderRadius: BorderRadius.circular(24),

  boxShadow: const [

    BoxShadow(
      color: Colors.black26,
      blurRadius: 30,
    ),

  ],
);