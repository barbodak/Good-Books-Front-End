import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fidibod',
      theme: globalTheme.get(),
      home: const welcome_page(),
    ),
  );
  // welcome_page());
}
