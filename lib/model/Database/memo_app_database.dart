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
  Future<List<Map<String, Object?>>?> getDatabase() async {
    Exception? error;
    try {
      print("######DB接続開始######");
      await getDbPath();
      final _db = await openDatabase(_path, version: _databaseVersion,
          onCreate: (Database database, int version) async {
        await database.execute(_createDatabaseQuery);
      });
      print("######DB接続完了######");
      _database = _db;

      // deleteDatabase(_path);
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }
    // Console
    print("-----データベース-----");
    var _table = await _database.query(_tableName);
    _table.forEach((element) {
      print("DB内:${element}");
    });
    print("====================");
    return _table;
  }

  //############################################
  //パスの取得
  //############################################
  @override
  Future<void> getDbPath() async {
    Exception? error;
    try {
      print("######Path取得開始######");
      final _dbDirectory = await getApplicationSupportDirectory();
      final _dbFilePath = _dbDirectory.path;
      final _rootPath = join(_dbFilePath, _databaseName);
      print("######Path取得完了######");
      _path = _rootPath;
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }
    // Console
    print("-----データベース-----");
    print("FilePath:" + _path);
    print("====================");
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
      await getDatabase();
      print("######データ追加開始######");
      await _database.insert(
        _tableName,
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await Future.delayed(Duration(seconds: 1));

      print("######データ追加完了######");
      // Console
      print("-----データベース-----");
      var _table = await _database.query(_tableName);
      _table.forEach((element) {
        print("DB内:${element}");
      });
      print("====================");
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

  //############################################
  //データ更新
  //############################################
  Future<bool> updateMemo(Map<String, dynamic> value) async {
    Exception? error;
    try {
      await getDatabase();
      print("######データ更新開始######");
      await _database.update(
        _tableName,
        value,
        where: "id = ${value['id']}",
        conflictAlgorithm: ConflictAlgorithm.fail,
      );

      await Future.delayed(Duration(seconds: 1));

      print("######データ更新完了######");
      // Console
      print("-----データベース-----");
      var _table = await _database.query(_tableName);
      _table.forEach((element) {
        print("DB内:${element}");
      });
      print("====================");
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

  //############################################
  //データ削除
  //############################################
  @override
  Future<bool> deleteData(int id) async {
    Exception? error;
    try {
      await getDatabase();
      print("######データ削除開始######");
      await _database.delete(
        _tableName,
        where: "id = ?",
        whereArgs: [id],
      );
      print("######データ削除完了######");
      // Console
      print("-----データベース-----");
      var _table = await _database.query(_tableName);
      _table.forEach((element) {
        print("DB内:${element}");
      });
      print("====================");
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
  final String _databaseName = 'MemoApp.db';
  final int _databaseVersion = 1;
  final String _tableName = 'memo_master';
  final String _createDatabaseQuery =
      'CREATE TABLE memo_master (id INTEGER PRIMARY KEY AUTOINCREMENT,title VARCHAR(255),memo TEXT);';

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
  Future<void> deleteData(int id);
}
