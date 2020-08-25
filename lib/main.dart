import 'package:alcool_ou_gasolina/pages/home.page.dart';
import 'package:alcool_ou_gasolina/widgets/input.widget.dart';
import 'package:alcool_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:alcool_ou_gasolina/widgets/logo.wiget.dart';
import 'package:alcool_ou_gasolina/widgets/submit-form.widget.dart';
import 'package:alcool_ou_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alcool ou Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
