import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marcador_de_truco/providers/marcador_provider.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(ChangeNotifierProvider(
    create: (ctx) => MarcadorProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marcador de Truco Goiano',
        theme: ThemeData(
          primarySwatch: Colors.green,
          // accentColor: Colors.grey[900],
        ),
        home: HomePage());
  }
}
