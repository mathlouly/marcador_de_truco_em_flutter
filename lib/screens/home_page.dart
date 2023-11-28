// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marcador_de_truco/database/init_database.dart';
import 'package:marcador_de_truco/screens/historico_page.dart';
import 'package:marcador_de_truco/widgets/config_partida.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseInit db = DatabaseInit();
  BannerAd? _bannerAd;

  void loadAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: dotenv.get('CaAppPub'),
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {});
      }, onAdFailedToLoad: (ad, loadError) {
        print(loadError.message);
      }),
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fundo.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          ),
          Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => configPartida(context, db),
                      barrierDismissible: false),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black38),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    'INICIAR',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoricoPage(db))),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black38),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    'HISTÓRICO',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
          if (_bannerAd != null) AdWidget(ad: _bannerAd!),
        ],
      ),
    );
  }
}
