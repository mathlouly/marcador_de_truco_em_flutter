import 'dart:async';

class ContadorStream {
  ContadorStream(this.quantPontos);

  Map pontos = {};
  int? quantPontos;
  String? nameTeamWinner;
  bool isWinner = false;
  final StreamController controller = StreamController<int>.broadcast();

  addTeams(List<String> teams) {
    for (var i = 0; i < teams.length; i++) {
      pontos[teams[i]] = 0;
    }
  }

  countAdd(int value, String nameTeam) {
    pontos[nameTeam] += value;
    controller.add(pontos[nameTeam]);
    if (pontos[nameTeam] >= quantPontos) {
      winner(nameTeam);
      isWinner = true;
      controller.close();
    }
  }

  countLess(int value, String nameTeam) {
    if (value == 3 && pontos[nameTeam] >= 3) {
      pontos[nameTeam] -= value;
    } else if (value == 3 && pontos[nameTeam] >= 2) {
      pontos[nameTeam] -= value - 1;
    } else if (value == 3 && pontos[nameTeam] >= 1) {
      pontos[nameTeam] -= value - 2;
    } else if (value == 1 && pontos[nameTeam] > 0) {
      pontos[nameTeam] -= value;
    }
    controller.add(pontos[nameTeam]);
  }

  bool winner(String nameTeam) {
    nameTeamWinner = nameTeam;
    return isWinner;
  }

  Stream get stream => controller.stream;
}
