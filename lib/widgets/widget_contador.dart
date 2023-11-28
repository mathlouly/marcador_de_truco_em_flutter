// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetContador extends StatelessWidget {
  WidgetContador({
    Key? key,
    required this.nameTeam,
    required this.points,
    required this.corTeam,
    required this.addPoint,
    required this.lessPoint,
  }) : super(key: key);

  final String nameTeam;
  final int points;
  final Color corTeam;
  final Function(int point) addPoint;
  final Function(int point) lessPoint;

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
                nameTeam.toUpperCase(),
                style: TextStyle(
                  color: corTeam,
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
                  points.toString(),
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
                buttonContador("+", 1, Colors.white, Colors.green, addPoint),
                buttonContador("+", 3, Colors.white, Colors.green, addPoint),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonContador("-", 1, Colors.white, Colors.red, lessPoint),
                buttonContador("-", 3, Colors.white, Colors.red, lessPoint),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonContador(String sinal, int valor, Color fontColor, Color backgroundColor, Function(int point) count) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              overlayColor: MaterialStateProperty.all(
                Colors.green[100],
              )),
          onPressed: () => count(valor),
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
