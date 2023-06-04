import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/Database/memo_app_database.dart';
import 'package:memo_app/model/memo_model.dart';
import 'package:memo_app/model/repository/database_state.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';

final databaseProvider =
    StateNotifierProvider<DatabaseNotifier, DatabaseState>((ref) {
  return DatabaseNotifier();
});

class DatabaseNotifier extends StateNotifier<DatabaseState> {
  DatabaseNotifier() : super(DatabaseStateInitialize());

  Future<void> connectionDatabase() async {
    Exception? error;
    List<MomoModel> array = [];
    int i = 0;
    try {
      state = DatabaseStateInitializing(memoList: state.memoList);

      var _result = await MemoAppDatabase().getDatabase();

      if (_result == null) {
        return;
      }

      _result.forEach((element) {
        MomoModel memodaital = MomoModel(
            id: int.parse(element['id'].toString()),
            title: element['title'].toString(),
            memo: element['memo'].toString());
        array.add(memodaital);
      });
      state = DatabaseStateInitializing(memoList: array);

      if (state.memoList != null) {
        state.memoList!.forEach((element) {
          print("state内:${element}");
        });
      } else {
        print("state内:null");
      }
      //初期化完了
      state = DatabaseStateInitialized(memoList: state.memoList);
    } on Exception catch (e) {
      error = e;
    } finally {
      if (error != null) {
        throw error;
      }
    }
  }

  Future<bool> addMemoDatabase(String title, String memo) async {
    Exception? error;
    bool result = false;
    try {
      //初期化中
      state = DatabaseStateInitializing(memoList: state.memoList);

      Map<String, dynamic> memo_daital = {'title': title, 'memo': memo};

      result = await MemoAppDatabase().insertData(memo_daital);

      refreshStateData();

      //初期化完了
      state = DatabaseStateInitialized(memoList: state.memoList);
    } on Exception catch (e) {
      error = e;
    } finally {
      if (error != null) {
        throw error;
      }
      return result;
    }
  }

  Future<bool> updateMemoDatabase(int id, String title, String memo) async {
    Exception? error;
    bool result = false;
    try {
      //初期化中
      state = DatabaseStateInitializing(memoList: state.memoList);

      Map<String, dynamic> memo_daital = {
        'id': id,
        'title': title,
        'memo': memo
      };

      result = await MemoAppDatabase().updateMemo(memo_daital);

      await refreshStateData();

      //初期化完了
      state = DatabaseStateInitialized(memoList: state.memoList);
    } on Exception catch (e) {
      error = e;
    } finally {
      if (error != null) {
        throw error;
      }
      return result;
    }
  }

  Future<bool> deleteMemoDatabase(int id) async {
    Exception? error;
    bool result = false;
    try {
      //初期化中
      state = DatabaseStateInitializing(memoList: state.memoList);

      int memo_daital = id;

      result = await MemoAppDatabase().deleteData(memo_daital);

      await refreshStateData();

      //初期化完了
      state = DatabaseStateInitialized(memoList: state.memoList);
    } on Exception catch (e) {
      error = e;
    } finally {
      if (error != null) {
        throw error;
      }
      return result;
    }
  }

  Future<void> refreshStateData() async {
    Exception? error;
    try {
      List<MomoModel> array = [];
      var _result = await MemoAppDatabase().getDatabase();
      if (_result == null) {
        return;
      }

      _result.forEach((element) {
        MomoModel memodaital = MomoModel(
            id: int.parse(element['id'].toString()),
            title: element['title'].toString(),
            memo: element['memo'].toString());
        array.add(memodaital);
      });
      state = DatabaseStateInitializing(memoList: array);

      if (state.memoList != null) {
        state.memoList!.forEach((element) {
          print("state内:${element}");
        });
      } else {
        print("state内:null");
      }
    } on Exception catch (e) {
      error = e;
    }
  }
}
