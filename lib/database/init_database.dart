import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInit {
  late Database db;
  late String databasePath;
  late String path;

  DatabaseInit() {
    initDatabase();
  }

  initDatabase() async {
    try {
      databasePath = await getDatabasesPath();
      path = join(databasePath, "historico.db");
      db = await openDatabase("historico.db", version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE historico (id INTEGER PRIMARY KEY, teamWinner TEXT, teamOne TEXT, teamTwo TEXT, ptsTeamOne int, ptsTeamTwo int, dataPartida TEXT)");
        print('Create');
      });
    } catch (e) {
      print(e);
    }
  }

  writeDatabase(String teamWinner, String teamOne, String teamTwo, int ptsTeamOne, int ptsTeamTwo, dataPartida) async {
    try {
      await db.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO historico(teamWinner, teamOne, teamTwo, ptsTeamOne, ptsTeamTwo, dataPartida) VALUES("$teamWinner", "$teamOne", "$teamTwo", $ptsTeamOne, $ptsTeamTwo, "$dataPartida")');
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map>?> readDatabase() async {
    List<Map>? list;
    await db.transaction((txn) async {
      await txn.rawQuery("SELECT * FROM historico").then((value) {
        list = value;
      });
    });
    return list;
  }

  void closeDatabase() => () => db.close();
}
