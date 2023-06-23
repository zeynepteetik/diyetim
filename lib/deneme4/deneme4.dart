/*import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/weight_info.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();

  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'gym_database.db');
    var dbWeightGroup =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbWeightGroup;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE weight_group(id INTEGER PRIMARY KEY, name TEXT, weight INTEGER)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('weight_group');
  }

  Future<void> insertWeightGroup(WeightInfo group) async {
    final Database? db = await this.db;
    await db?.insert(
      'weight_group',
      group.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WeightInfo>> members() async {
    // Get a reference to the database.
    final Database? db = await this.db;

    final List<Map<String, Object?>>? maps = await db?.query('weight_group');

    return List.generate(maps!.length, (i) {
      return WeightInfo(
        id: int.parse(maps[i]['id'].toString()),
        name: maps[i]['name'].toString(),
        weight: int.parse(maps[i]['date'].toString()),
      );
    });
  }

  Future<void> updateWeightGroup(WeightInfo member) async {
    final db = await this.db;
    await db?.update(
      'weight_group',
      member.toMap(),
      where: "id = ?",
      whereArgs: [member.id],
    );
  }

  Future<void> deleteWeightGroup(int id) async {
    final db = await this.db;
    await db?.delete(
      'weight_group',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
*/