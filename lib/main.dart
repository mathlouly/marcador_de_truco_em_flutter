import 'package:flutter/material.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  await DotEnv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  Admob.requestTrackingAuthorization();
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
        home: HomePage()); //MarcadorPageStream(quantPontos: 12, nameTeamOne: 'Time 1', nameTeamTwo: 'Time 2'));
  }
}
