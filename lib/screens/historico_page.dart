import 'package:flutter/material.dart';
import 'package:marcador_de_truco/database/init_database.dart';

class HistoricoPage extends StatelessWidget {
  final DatabaseInit db;
  HistoricoPage(this.db);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.readDatabase(),
      builder: (context, snapshot) {
        List<Map> list = List.from(snapshot.data.reversed);
        return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor: Colors.grey[800].withOpacity(0.7),
            title: Text(
              "HISTÓRICO",
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: snapshot.hasData && list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, lenHistorico) {
                    String data = list[lenHistorico]['dataPartida'].split(" ")[0];
                    String hora = list[lenHistorico]['dataPartida'].split(" ")[1];
                    return Container(
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        shadowColor: list[lenHistorico]['teamWinner'] == list[lenHistorico]['teamOne'] ? Colors.greenAccent : Colors.redAccent,
                        elevation: 1,
                        color: Colors.grey[800].withOpacity(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                alignment: Alignment.center,
                                color: list[lenHistorico]['teamWinner'] == list[lenHistorico]['teamOne'] ? Colors.green[800] : Colors.red[800],
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Vencedor: ${list[lenHistorico]['teamWinner']}",
                                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${list[lenHistorico]['teamOne']}",
                                        style: TextStyle(fontSize: 23, color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${list[lenHistorico]['ptsTeamOne']}",
                                        style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(children: [Icon(Icons.close, size: 40, color: Colors.white)]),
                                  Column(
                                    children: [
                                      Text(
                                        "${list[lenHistorico]['teamTwo']}",
                                        style: TextStyle(fontSize: 23, color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${list[lenHistorico]['ptsTeamTwo']}",
                                        style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              color: list[lenHistorico]['teamWinner'] == list[lenHistorico]['teamOne'] ? Colors.green[800].withOpacity(0.5) : Colors.red[800].withOpacity(0.5),
                              child: Text(
                                "Data: $data  Hora: $hora",
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Não encontramos o que você espera",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.not_interested,
                        size: 100,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
