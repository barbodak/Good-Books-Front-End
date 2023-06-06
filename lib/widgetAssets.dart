import 'package:flutter/material.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

class myBoxDecoration {
  static BoxDecoration get(Color c) {
    if (c == Null) c = globalTheme.getCS().primary.withOpacity(0.1);
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: c,
    );
  }
}
