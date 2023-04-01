import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note_model.dart';

class NoteDatabaseService {
  final String tableName = 'note';
  NoteDatabaseService? database;
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'note.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""CREATE TABLE IF NOT EXISTS $tableName (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        title TEXT NOT NULL,
                        icerik TEXT NOT NULL)
                          """);
      },
    );
  }

  // insert data
  Future insertTable(NoteDatabaseModel items) async {
    if (database != null) initializedDB();
    int result = 0;
    final Database db = await initializedDB();

    result = await db.insert(tableName, items.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return result;
  }

  Future<List<NoteDatabaseModel>> retrieveTable() async {
    if (database != null) initializedDB();
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query(tableName);
    return queryResult.map((e) => NoteDatabaseModel.fromMap(e)).toList();
  }

  Future<void> updateRow(int id, NoteDatabaseModel item) async {
    if (database != null) initializedDB();
    final Database db = await initializedDB();
    db.update(tableName, item.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<List<NoteDatabaseModel>> queryRowCount(int id) async {
    Database db = await initializedDB();
    List<Map<String, Object?>> rowCall =
        await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return rowCall.map((e) => NoteDatabaseModel.fromMap(e)).toList();
  }

  Future<void> deleteRow(int id) async {
    if (database != null) initializedDB();
    final db = await initializedDB();
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
