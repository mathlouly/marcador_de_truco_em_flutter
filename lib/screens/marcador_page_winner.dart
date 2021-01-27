import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marcador_de_truco/screens/home_page.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';
/*
 * Pagina após ter ganhado a partida
 */

Widget marcadorPageWinner(String nameTeamWinner, context, nameTeamOne, nameTeamTwo, quantPontos, ptsTeamOne, ptsTeamTwo, db) {
  String dataPartida = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}";
  db.writeDatabase(nameTeamWinner, nameTeamOne, nameTeamTwo, ptsTeamOne, ptsTeamTwo, dataPartida);
  return Stack(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$nameTeamWinner\nGANHOU!!!"),
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.black38),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  db: db,
                                )),
                        (route) => false),
                    child: Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 40,
                ),
                TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.black38),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => MarcadorPage(
                                    quantPontos: quantPontos,
                                    nameTeamOne: nameTeamOne,
                                    nameTeamTwo: nameTeamTwo,
                                    db: db,
                                  )),
                          (route) => false);
                    },
                    child: Icon(
                      Icons.replay,
                      size: 40,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 0,
        child: AdmobBanner(adUnitId: env['CaAppPub'], adSize: AdmobBannerSize.FULL_BANNER),
      ),
    ],
  );
}
