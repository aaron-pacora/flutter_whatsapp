import 'package:flutter/material.dart';

import 'package:flutter_whatsapp/features/home/presentation/pages/home_page.dart';
import 'package:flutter_whatsapp/app/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: LIGTH_PRIMARY_COLOR,
        accentColor: LIGTH_ACCENT_COLOR,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: LIGTH_ACCENT_COLOR
        ),
        primaryIconTheme: IconThemeData(
          color: LIGTH_PRIMARY_COLOR,
        )
      ),
      home: HomePage(),
    );
  }
}