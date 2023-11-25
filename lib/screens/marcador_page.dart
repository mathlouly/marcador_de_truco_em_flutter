// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:marcador_de_truco/database/init_database.dart';
import 'package:marcador_de_truco/screens/marcador_page_count.dart';
import 'package:marcador_de_truco/screens/marcador_page_winner.dart';
import 'package:marcador_de_truco/stream/contador_stream.dart';

class MarcadorPage extends StatefulWidget {
  final int quantPontos;
  final String nameTeamOne;
  final String nameTeamTwo;
  final DatabaseInit db;

  const MarcadorPage({
    Key? key,
    required this.quantPontos,
    required this.nameTeamOne,
    required this.nameTeamTwo,
    required this.db,
  }) : super(key: key);

  @override
  _MarcadorPageState createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  @override
  Widget build(BuildContext context) {
    ContadorStream _contadorStream = ContadorStream(widget.quantPontos);
    _contadorStream.addTeams([widget.nameTeamOne, widget.nameTeamTwo]);
    return Container(
      color: Colors.grey[900],
      child: StreamBuilder(
          initialData: 0,
          stream: _contadorStream.stream,
          builder: (context, snap) {
            return _contadorStream.isWinner
                ? marcadorPageWinner(
                    _contadorStream.nameTeamWinner ?? '',
                    context,
                    widget.nameTeamOne,
                    widget.nameTeamTwo,
                    widget.quantPontos,
                    _contadorStream.pontos[widget.nameTeamOne],
                    _contadorStream.pontos[widget.nameTeamTwo],
                    widget.db)
                : marcadorPageCount(widget.nameTeamOne, widget.nameTeamTwo, widget.quantPontos, _contadorStream);
          }),
    );
  }
}
