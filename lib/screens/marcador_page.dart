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
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fundo.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(-3, 3),
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
                ),
                Contador(
                  nameTeam: nameTeamTwo,
                  quantPontos: quantPontos,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
