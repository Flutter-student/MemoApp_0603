import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MemoAppDatabase extends _DatabaseInfo implements _DatabaseInterfase {
  //------------------------------------------------------------
  //　初期化処理
  //############################################
  //DBを開く（なければ作成する）
  //############################################
  @override
  Future<void> getDatabase() async {
    Exception? error;
    try {
      await getDbPath();
      final _db = await openDatabase(_path, version: _databaseVersion,
          onCreate: (Database database, int version) async {
        await database.execute(_createDatabaseQuery);
      });
      _database = _db;
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }
    // Console
    var _table = await _database.query(_tableName);
    _table.forEach(print);
  }

  //############################################
  //パスの取得
  //############################################
  @override
  Future<void> getDbPath() async {
    Exception? error;
    try {
      final _dbDirectory = await getApplicationSupportDirectory();
      final _dbFilePath = _dbDirectory.path;
      final _rootPath = join(_dbFilePath, _databaseName);
      _path = _rootPath;
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }

    // Console
    print("FilePath:" + _path);
  }
  // 初期化完了
  //------------------------------------------------------------

  //############################################
  //データ追加
  //############################################
  @override
  Future<bool> insertData(Map<String, dynamic> value) async {
    Exception? error;
    try {
      await _database.insert(
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
  final String _databaseName = "MemoApp.db";
  final int _databaseVersion = 1;
  final String _tableName = "memo_table";
  final String _createDatabaseQuery =
      'CREATE TABLE memo_table (id INT PRIMARY KEY NOT NULL,title VARCHAR(255),memo TEXT);';

  /// 取得DB情報保持
  late final Database _database;
  late final String _path;
}

//Interfase
//Internal Method
abstract class _DatabaseInterfase {
  Future<void> getDatabase();
  Future<void> getDbPath();
  Future<bool> insertData(Map<String, dynamic> value);
}
