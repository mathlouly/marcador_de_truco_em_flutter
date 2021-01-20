import 'package:flutter/material.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
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
      home: MarcadorPage(12, 'A', 'B'),
    );
  }
}
