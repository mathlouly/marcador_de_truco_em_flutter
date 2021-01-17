import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  Contador({Key key, @required this.nameTeam, @required this.quantPontos}) : super(key: key);

  final String nameTeam;
  final int quantPontos;
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                widget.nameTeam,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: Center(
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                    fontSize: 70,
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
                buttonContador("+", 1, Colors.white, Colors.black, () => setState(() => value += 1)),
                buttonContador("+", 3, Colors.white, Colors.red[900], () => setState(() => value += 3)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonContador("-", 1, Colors.white, Colors.black, () => setState(() => value > 0 ? value -= 1 : null)),
                buttonContador("-", 3, Colors.white, Colors.red[900], () {
                  setState(() {
                    if (value > 0) {
                      if (value > 1) {
                        if (value > 2) {
                          value -= 3;
                        } else {
                          value -= 2;
                        }
                      } else {
                        value -= 1;
                      }
                    }
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonContador(String sinal, int valor, Color fontColor, Color backgroundColor, Function fun) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              overlayColor: MaterialStateProperty.all(
                Colors.green[100],
              )),
          onPressed: fun,
          child: Center(
            child: Text(
              "$sinal" + valor.toString(),
              style: TextStyle(fontSize: 35, color: fontColor),
            ),
          ),
        ),
      ),
    );
  }
}
