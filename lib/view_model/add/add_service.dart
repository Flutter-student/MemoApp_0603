import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/memo_model.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/model/repository/database_state.dart';
import 'package:memo_app/view_model/add/add_state.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';

final AddProvider = StateNotifierProvider<AddNotifier, AddState>((ref) {
  return AddNotifier(ref);
});

class AddNotifier extends StateNotifier<AddState> {
  Ref ref;
  AddNotifier(this.ref) : super(AddStateInitialize());

  // late

  Future<void> InputTitle(String value) async {
    state = InputingTitle(title: value, memo: state.memo);
    print(state.title);
  }

  Future<void> InputMemo(String value) async {
    state = InputingTitle(title: state.title, memo: value);
    print(state.memo);
  }

  Future<void> AddMemo() async {
    DatabaseNotifier _databaseController = ref.read(databaseProvider.notifier);
    Exception? error;
    try {
      if (state.title == null || state.memo == null) {
        return;
      }
      // 初期化中
      state = AddStateInitializing(title: state.title, memo: state.memo);

      var result =
          await _databaseController.addMemoDatabase(state.title!, state.memo!);

      if (result) {
        print("【DB追加完了】");
      } else {
        print("【DB追加失敗】");
      }
      // 初期化完了
      state = AddStateInitialized();
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }
  }
}
