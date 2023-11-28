import 'package:flutter/material.dart';
import 'package:marcador_de_truco/data/models/settings_game_model.dart';
import 'package:marcador_de_truco/database/init_database.dart';

class MarcadorProvider extends ChangeNotifier {
  final DatabaseInit db = DatabaseInit();

  SettingsGameModel? _settingsGameModel;
  String? _nameTeamWinner;
  bool _isWinner = false;

  int _pointsTeamOne = 0;
  int _pointsTeamTwo = 0;

  String get nameTeamOne => _settingsGameModel?.nameTeamOne ?? '';
  String get nameTeamTwo => _settingsGameModel?.nameTeamTwo ?? '';
  String? get nameTeamWinner => _nameTeamWinner;
  bool get isWinner => _isWinner;
  int get pointsTeamOne => _pointsTeamOne;
  int get pointsTeamTwo => _pointsTeamTwo;

  void configGame(SettingsGameModel settings) {
    _settingsGameModel = settings;
    resetGame();
  }

  void resetGame() {
    _isWinner = false;
    _pointsTeamOne = 0;
    _pointsTeamTwo = 0;
  }

  void addPointTeamOne(int points) {
    if (_settingsGameModel != null) {
      final prevPoint = _pointsTeamOne + points;
      if (prevPoint > _settingsGameModel!.maxPoints) {
        _pointsTeamOne = _settingsGameModel!.maxPoints;
      }

      if (prevPoint >= _settingsGameModel!.maxPoints) {
        _nameTeamWinner = _settingsGameModel!.nameTeamOne;
        winGame();
      } else {
        _pointsTeamOne += points;
      }

      notifyListeners();
    }
  }

  void lessPointTeamOne(int points) {
    if (_settingsGameModel != null) {
      final prevPoint = _pointsTeamOne - points;
      if (prevPoint < 0)
        _pointsTeamOne = 0;
      else
        _pointsTeamOne -= points;

      notifyListeners();
    }
  }

  void addPointTeamTwo(int points) {
    if (_settingsGameModel != null) {
      final prevPoint = _pointsTeamTwo + points;
      if (prevPoint > _settingsGameModel!.maxPoints) {
        _pointsTeamTwo = _settingsGameModel!.maxPoints;
      }

      if (prevPoint >= _settingsGameModel!.maxPoints) {
        _nameTeamWinner = _settingsGameModel!.nameTeamTwo;
        winGame();
      } else {
        _pointsTeamTwo += points;
      }

      notifyListeners();
    }
  }

  void lessPointTeamTwo(int points) {
    if (_settingsGameModel != null) {
      final prevPoint = _pointsTeamTwo - points;
      if (prevPoint < 0)
        _pointsTeamTwo = 0;
      else
        _pointsTeamTwo -= points;

      notifyListeners();
    }
  }

  void winGame() {
    final dateGame =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}";
    db.writeDatabase(
      nameTeamWinner ?? '',
      nameTeamOne,
      nameTeamTwo,
      pointsTeamOne,
      pointsTeamTwo,
      dateGame,
    );
    _isWinner = true;
  }
}
