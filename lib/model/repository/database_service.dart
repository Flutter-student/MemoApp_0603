import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/Database/memo_app_database.dart';
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
    try {
      state = DatabaseStateInitializing(memoList: state.memoList);

      await MemoAppDatabase().getDatabase();
    } on Exception catch (e) {
      error = e;
    } finally {
      if (error != null) {
        throw error;
      }
    }
  }
}
