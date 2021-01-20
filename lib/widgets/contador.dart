import 'package:flutter/material.dart';
import 'package:marcador_de_truco/widgets/win_widget.dart';

class Contador extends StatefulWidget {
  Contador({Key key, @required this.nameTeam, @required this.quantPontos, @required this.corTeam}) : super(key: key);

  final String nameTeam;
  final int quantPontos;
  final Color corTeam;
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800].withOpacity(0.3),
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
                  value.toString(),
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
                buttonContador("+", 1, Colors.white, Colors.green, () => setState(() => value += 1), widget.nameTeam),
                buttonContador("+", 3, Colors.white, Colors.green, () => setState(() => value += 3), widget.nameTeam),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonContador("-", 1, Colors.white, Colors.red, () => setState(() => value > 0 ? value -= 1 : null), widget.nameTeam),
                buttonContador("-", 3, Colors.white, Colors.red, () {
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
                }, widget.nameTeam),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonContador(String sinal, int valor, Color fontColor, Color backgroundColor, Function fun, String nameTeam) {
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
              style: TextStyle(fontSize: 25, color: fontColor),
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> winner(nameTeam) async {
    return showDialog(context: context, builder: (context) => winnerRound(context, nameTeam), barrierDismissible: false, barrierColor: Colors.transparent);
  }
}
