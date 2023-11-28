import 'package:flutter/material.dart';
import 'package:marcador_de_truco/data/models/settings_game_model.dart';
import 'package:marcador_de_truco/providers/marcador_provider.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';
import 'package:provider/provider.dart';

Widget configPartida(BuildContext context, db) {
  TextEditingController teamOne = TextEditingController();
  TextEditingController teamTwo = TextEditingController();
  TextEditingController maxPoints = TextEditingController();
  List notSymbols = ['-', ' ', '_', '.', ','];

  return StatefulBuilder(builder: (context, setState) {
    return AlertDialog(
      content: FractionallySizedBox(
        heightFactor: MediaQuery.of(context).viewInsets.bottom > 200
            ? MediaQuery.of(context).viewInsets.bottom < 250
                ? 0.9
                : 1.1
            : 0.65,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Text(
                          "Configurar Partida",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: teamOne,
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Time 1",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                maxLength: 10,
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: teamTwo,
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Time 2",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                maxLength: 10,
                maxLines: 1,
              ),
              SizedBox(
                height: 0,
              ),
              Container(
                child: Center(
                  child: TextFormField(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    maxLength: 2,
                    controller: maxPoints,
                    onTap: () {},
                    onChanged: (newValue) {
                      for (int i = 0; i < notSymbols.length; i++) {
                        if (newValue.contains(notSymbols[i])) {
                          maxPoints.text = maxPoints.text.replaceAll(notSymbols[i], '');
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade de pontos',
                      fillColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<MarcadorProvider>(
                builder: (ctx, provider, child) {
                  return TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.black38),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Center(
                      child: Text(
                        'COMEÇAR',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    onPressed: () {
                      if (maxPoints.text.length > 0 &&
                          maxPoints.text.length <= 99 &&
                          teamOne.text.length > 0 &&
                          teamOne.text.length <= 10 &&
                          teamTwo.text.length > 0 &&
                          teamTwo.text.length <= 10) {
                        provider.configGame(SettingsGameModel(
                          nameTeamOne: teamOne.text,
                          nameTeamTwo: teamTwo.text,
                          maxPoints: int.parse(maxPoints.text),
                        ));
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MarcadorPage()),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                ),
                child: Center(
                  child: Text(
                    'CANCELAR',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  });
}
