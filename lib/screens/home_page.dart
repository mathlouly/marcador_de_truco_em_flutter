import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:marcador_de_truco/widgets/config_partida.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdmobBanner banner;
  bool isShow = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fundo.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          ),
          Column(
            children: [
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
                height: 10,
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
          isShow
              ? AdmobBanner(
                  adUnitId: env['CaAppPub'],
                  adSize: AdmobBannerSize.FULL_BANNER,
                  listener: (AdmobAdEvent event, Map<String, dynamic> args) {
                    //event == AdmobAdEvent.failedToLoad ? setState(() => isShow = false) : print('carregou');
                    print(event);
                  },
                )
              : Container(
                  color: Colors.black,
                  child: Text('Not load admob'),
                ),
        ],
      ),
    );
  }
}
