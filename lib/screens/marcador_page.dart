// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marcador_de_truco/database/init_database.dart';
import 'package:marcador_de_truco/providers/marcador_provider.dart';
import 'package:marcador_de_truco/screens/marcador_page_winner.dart';
import 'package:marcador_de_truco/widgets/widget_contador.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({
    Key? key,
  }) : super(key: key);

  @override
  _MarcadorPageState createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  final DatabaseInit db = DatabaseInit();
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
    Wakelock.toggle(enable: true);
    return Container(
      color: Colors.grey[900],
      child: Consumer<MarcadorProvider>(
        builder: (ctx, provider, child) {
          if (provider.isWinner) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MarcadorPageWinner()),
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red[900] ?? Colors.red,
                          blurRadius: 5,
                          spreadRadius: 0.5,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'PLACAR',
                        style: TextStyle(fontSize: 50, color: Colors.white, decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WidgetContador(
                      nameTeam: provider.nameTeamOne,
                      points: provider.pointsTeamOne,
                      corTeam: Colors.white,
                      addPoint: provider.addPointTeamOne,
                      lessPoint: provider.lessPointTeamOne,
                    ),
                    WidgetContador(
                      nameTeam: provider.nameTeamTwo,
                      points: provider.pointsTeamTwo,
                      corTeam: Colors.white,
                      addPoint: provider.addPointTeamTwo,
                      lessPoint: provider.lessPointTeamTwo,
                    ),
                  ],
                ),
              ),
              if (_bannerAd != null) AdWidget(ad: _bannerAd!),
            ],
          );
        },
      ),
    );
  }
}
