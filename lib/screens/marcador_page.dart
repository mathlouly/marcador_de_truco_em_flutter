import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:marcador_de_truco/widgets/contador.dart';

class MarcadorPage extends StatelessWidget {
  final int quantPontos;
  final String nameTeamOne;
  final String nameTeamTwo;

  MarcadorPage(this.quantPontos, this.nameTeamOne, this.nameTeamTwo);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
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
                Contador(
                  nameTeam: nameTeamOne,
                  quantPontos: quantPontos,
                  corTeam: Colors.white,
                ),
                Contador(
                  nameTeam: nameTeamTwo,
                  quantPontos: quantPontos,
                  corTeam: Colors.white,
                ),
              ],
            ),
          ),
          AdmobBanner(adUnitId: 'ca-app-pub-5225090572765616/9741816970', adSize: AdmobBannerSize.FULL_BANNER),
        ],
      ),
    );
  }
}
