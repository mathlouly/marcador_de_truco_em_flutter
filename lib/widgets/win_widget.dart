import 'package:flutter/material.dart';

Widget winnerRound(context, nameTeam) {
  TextStyle styleText = TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
  return AlertDialog(
    backgroundColor: Colors.red,
    content: FractionallySizedBox(
      heightFactor: 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$nameTeam',
            style: styleText,
          ),
          Text(
            'GANHOU!!!',
            style: styleText,
          ),
        ],
      ),
    ),
  );
}
