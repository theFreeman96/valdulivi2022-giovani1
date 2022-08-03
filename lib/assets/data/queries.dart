import 'database_helper.dart';
import 'models.dart';

class QueryCtr {
  DatabaseHelper con = DatabaseHelper();

  Future<List<Songs>?> getAllSongs() async {
    final dbClient = await con.db;
    final res = await dbClient!.query('Songs', groupBy: 'id');

    List<Songs>? list =
        res.isNotEmpty ? res.map((c) => Songs.fromMap(c)).toList() : null;

    return list;
  }

  Future<List<Songs>?> searchSong(String keyword) async {
    final dbClient = await con.db;
    final res = await dbClient!.rawQuery(
        'SELECT * FROM View_Raccolta WHERE songId LIKE "%$keyword%" OR  songTitle LIKE "%$keyword%" OR songText LIKE "%$keyword%" group by songId order by songId');

    List<Songs>? list =
        res.isNotEmpty ? res.map((c) => Songs.fromMap(c)).toList() : null;

    return list;
  }
}
