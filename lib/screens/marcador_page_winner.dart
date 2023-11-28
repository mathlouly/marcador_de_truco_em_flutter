// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marcador_de_truco/providers/marcador_provider.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';

class MarcadorPageWinner extends StatefulWidget {
  const MarcadorPageWinner({
    Key? key,
  }) : super(key: key);

  @override
  State<MarcadorPageWinner> createState() => _MarcadorPageWinnerState();
}

class _MarcadorPageWinnerState extends State<MarcadorPageWinner> {
  BannerAd? _bannerAd;

  void loadAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: dotenv.get('CaAppPub'),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {});
        },
      ),
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
    Wakelock.toggle(enable: false);

    final marcadorProvider = context.watch<MarcadorProvider>();

    List<String> desafios = [
      "Vire uma dose de tequila.",
      "Vire uma lata de cerveja.",
      "Beba cerveja quente.",
      "Fique 2 partidas sem beber.",
      "Encha a boca com alguma bebida e gire a cabeça.",
      "Beba água com cerveja.",
      "Vire uma dose de vodka.",
    ];
    int desafioValue = Random().nextInt(desafios.length);
    return Container(
      color: Colors.grey[900],
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/trofeu.png",
                  fit: BoxFit.contain,
                  height: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "${marcadorProvider.nameTeamWinner}\nVenceu a partida.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32, color: Colors.white, decoration: TextDecoration.none, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 55,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.red[50]),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          content: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/devil.png',
                                    fit: BoxFit.contain,
                                    height: 130,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    desafios[desafioValue],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "Desafio Perdedor",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.black38),
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                    (route) => false,
                                  ),
                              child: Icon(
                                Icons.close,
                                size: 40,
                                color: Colors.white,
                              )),
                          SizedBox(height: 10),
                          Text(
                            "Sair",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.white, decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.black38),
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {
                                marcadorProvider.resetGame();
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => MarcadorPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Icon(
                                Icons.replay,
                                size: 40,
                                color: Colors.white,
                              )),
                          SizedBox(height: 10),
                          Text(
                            "Novamente",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.white, decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (_bannerAd != null) AdWidget(ad: _bannerAd!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
