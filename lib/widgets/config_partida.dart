import 'package:flutter/material.dart';
import 'package:marcador_de_truco/screens/marcador_page.dart';

Widget configPartida(BuildContext context) {
  TextEditingController teamOne = TextEditingController();
  TextEditingController teamTwo = TextEditingController();
  TextEditingController numberRound = TextEditingController();
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
                    maxLength: 3,
                    controller: numberRound,
                    onTap: () {},
                    onChanged: (newValue) {
                      for (int i = 0; i < notSymbols.length; i++) {
                        if (newValue.contains(notSymbols[i])) {
                          numberRound.text = numberRound.text.replaceAll(notSymbols[i], '');
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade de pontos',
                      fillColor: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black38),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  'Começar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {
                  if (numberRound.text.length > 0 && teamOne.text.length > 0 && teamTwo.text.length > 0)
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MarcadorPage(quantPontos: int.parse(numberRound.text), nameTeamOne: teamOne.text, nameTeamTwo: teamTwo.text)), (route) => false);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black38),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(
                        color: Colors.black,
                      ))),
                ),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.black, fontSize: 25),
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
