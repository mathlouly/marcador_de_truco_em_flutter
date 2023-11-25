import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:marcador_de_truco/database/init_database.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  Admob.requestTrackingAuthorization();
  final DatabaseInit db = DatabaseInit();
  runApp(MyApp(db));
}

class MyApp extends StatelessWidget {
  final db;
  MyApp(this.db);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marcador de Truco Goiano',
        theme: ThemeData(
          primarySwatch: Colors.green,
          // accentColor: Colors.grey[900],
        ),
        home: HomePage(db: db));
  }
}
