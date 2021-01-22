import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marcador_de_truco/stream/contador_stream.dart';
import 'package:marcador_de_truco/widgets/widget_contador.dart';

Widget marcadorPageCount(String nameTeamOne, String nameTeamTwo, int quantPontos, ContadorStream _contadorStream) {
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
                  color: Colors.red[900],
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
              nameTeam: nameTeamOne,
              quantPontos: quantPontos,
              corTeam: Colors.white,
              contadorStream: _contadorStream,
            ),
            WidgetContador(
              nameTeam: nameTeamTwo,
              quantPontos: quantPontos,
              corTeam: Colors.white,
              contadorStream: _contadorStream,
            ),
          ],
        ),
      ),
      AdmobBanner(adUnitId: env['CaAppPub'], adSize: AdmobBannerSize.FULL_BANNER),
    ],
  );
}
