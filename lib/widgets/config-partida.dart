import 'package:flutter/material.dart';

Widget configPartida(BuildContext context) {
  var _rodadas = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'];
  String newValueDropdown = '1';
  bool isExpanded = false;

  return StatefulBuilder(builder: (context, setState) {
    return AlertDialog(
      content: FractionallySizedBox(
        heightFactor: isExpanded ? 0.9 : 0.6,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text(
                    "Configurar Partida",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              TextFormField(
                onTap: () => setState(() => isExpanded = true),
                onFieldSubmitted: (value) => setState(() => isExpanded = false),
                decoration: InputDecoration(
                  labelText: "Time 1",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: () => setState(() => isExpanded = true),
                onFieldSubmitted: (value) => setState(() => isExpanded = false),
                decoration: InputDecoration(
                  labelText: "Time 2",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Número de pontos'),
              Container(
                child: Center(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    value: newValueDropdown,
                    items: _rodadas.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        newValueDropdown = value;
                      });
                    },
                    style: TextStyle(fontSize: 21, color: Colors.black),
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black38),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  'Começar',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
