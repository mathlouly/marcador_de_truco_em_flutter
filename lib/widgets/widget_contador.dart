// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:marcador_de_truco/stream/contador_stream.dart';

class WidgetContador extends StatefulWidget {
  WidgetContador({
    Key? key,
    required this.nameTeam,
    required this.quantPontos,
    required this.corTeam,
    required this.contadorStream,
  }) : super(key: key);

  final String nameTeam;
  final int quantPontos;
  final Color corTeam;
  final ContadorStream contadorStream;
  @override
  _WidgetContadorState createState() => _WidgetContadorState();
}

class _WidgetContadorState extends State<WidgetContador> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800]?.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                widget.nameTeam.toUpperCase(),
                style: TextStyle(
                  color: widget.corTeam,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  widget.contadorStream.pontos[widget.nameTeam].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w900,
                    fontSize: 80,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonContador("+", 1, Colors.white, Colors.green, widget.contadorStream.countAdd),
                buttonContador("+", 3, Colors.white, Colors.green, widget.contadorStream.countAdd),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonContador("-", 1, Colors.white, Colors.red, widget.contadorStream.countLess),
                buttonContador("-", 3, Colors.white, Colors.red, widget.contadorStream.countLess),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonContador(String sinal, int valor, Color fontColor, Color backgroundColor, Function count) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              overlayColor: MaterialStateProperty.all(
                Colors.green[100],
              )),
          onPressed: () => count(valor, widget.nameTeam),
          child: Center(
            child: Text(
              "$sinal" + valor.toString(),
              style: TextStyle(fontSize: 25, color: fontColor),
            ),
          ),
        ),
      ),
    );
  }
}
