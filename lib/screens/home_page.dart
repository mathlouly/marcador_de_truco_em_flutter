import 'package:flutter/material.dart';
import 'package:marcador_de_truco/widgets/config_partida.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fundo.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: TextButton(
              onPressed: () => showDialog(context: context, builder: (context) => configPartida(context), barrierDismissible: false),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black38),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'INICIAR',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black38),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'HISTÓRICO',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
