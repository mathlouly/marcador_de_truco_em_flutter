import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:marcador_de_truco/stream/contador_stream.dart';
import 'package:marcador_de_truco/widgets/contador.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarcadorPageStream extends StatefulWidget {
  final int quantPontos;
  final String nameTeamOne;
  final String nameTeamTwo;

  MarcadorPageStream({@required this.quantPontos, @required this.nameTeamOne, @required this.nameTeamTwo});

  @override
  _MarcadorPageStreamState createState() => _MarcadorPageStreamState();
}

class _MarcadorPageStreamState extends State<MarcadorPageStream> {
  @override
  Widget build(BuildContext context) {
    ContadorStream _contadorStream = ContadorStream(widget.quantPontos);
    _contadorStream.addTeams([widget.nameTeamOne, widget.nameTeamTwo]);

    return Container(
      color: Colors.grey[900],
      child: StreamBuilder(
          initialData: 0,
          stream: _contadorStream.stream,
          builder: (context, snap) {
            return _contadorStream.isWinner
                ? Stack(
                    children: [
                      Center(child: Text("${_contadorStream.nameTeamWinner}\nGANHOU!!!")),
                      Positioned(
                        bottom: 0,
                        child: AdmobBanner(adUnitId: env['CaAppPub'], adSize: AdmobBannerSize.FULL_BANNER),
                      ),
                    ],
                  )
                : Column(
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
                              nameTeam: widget.nameTeamOne,
                              quantPontos: widget.quantPontos,
                              corTeam: Colors.white,
                              contadorStream: _contadorStream,
                            ),
                            Contador(
                              nameTeam: widget.nameTeamTwo,
                              quantPontos: widget.quantPontos,
                              corTeam: Colors.white,
                              contadorStream: _contadorStream,
                            ),
                          ],
                        ),
                      ),
                      AdmobBanner(adUnitId: env['CaAppPub'], adSize: AdmobBannerSize.FULL_BANNER),
                    ],
                  );
          }),
    );
  }
}
