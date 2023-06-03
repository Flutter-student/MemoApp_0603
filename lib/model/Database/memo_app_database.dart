import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MemoAppDatabase extends _DatabaseInfo implements _DatabaseInterfase {
  //DBを開く（なければ作成する）
  @override
  Future<Database> getDatabase() async {
    final path = await getDbPath();
    final db = await openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await database.execute(_createDatabaseQuery);
    });
    var table = await db.query(_tableName);
    table.forEach(print);

    return db;
  }

  //############################################
  //OS毎にファイルを分けないやり方。パスの取得
  //############################################
  @override
  Future<String> getDbPath() async {
    final dbDirectory = await getApplicationSupportDirectory();
    final dbFilePath = dbDirectory.path;
    final path = join(dbFilePath, _databaseName);
    print("FilePath:" + path);
    return path;
  }

  //############################################
  //データ追加
  //############################################
  @override
  Future<bool> insertData() async {
    Exception? error;
    var value = {'title': "test01", 'memo': "shintaのテスト"};
    try {
      final db = await getDatabase();

      int id = await db.insert(
        _tableName,
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    } finally {
      if (error == null) {
        return true;
      }
      return false;
    }
  }
}

class _DatabaseInfo {
  final String _databaseName = "sample.db";
  final String _tableName = "sample_table";
  final String _createDatabaseQuery =
      'CREATE TABLE sample_table (id INT PRIMARY KEY NOT NULL,title VARCHAR(255),memo TEXT);';
}

//Interfase
//Internal Method
abstract class _DatabaseInterfase {
  Future<Database> getDatabase();
  Future<String> getDbPath();
  Future<bool> insertData();
}
