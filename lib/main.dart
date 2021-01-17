import 'package:flutter/material.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador de Truco Goiano',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
