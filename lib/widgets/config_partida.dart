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
                : 1
            : 0.6,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                    Container(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.black38),
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
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
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: teamTwo,
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Time 2",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: TextFormField(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    maxLength: 3,
                    controller: numberRound,
                    onTap: () {
                      print(MediaQuery.of(context).viewInsets.bottom);
                    },
                    onChanged: (newValue) {
                      for (int i = 0; i < notSymbols.length; i++) {
                        if (newValue.contains(notSymbols[i])) {
                          numberRound.text = numberRound.text.replaceAll(notSymbols[i], '');
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número de pontos',
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
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onPressed: () {
                  if (int.parse(numberRound.text) > 0 && teamOne.text.length > 0 && teamTwo.text.length > 0)
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MarcadorPage(int.parse(numberRound.text), teamOne.text, teamTwo.text)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  });
}
