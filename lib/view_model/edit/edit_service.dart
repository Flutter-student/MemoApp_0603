import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/Database/memo_app_database.dart';
import 'package:memo_app/model/memo_model.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';
import 'package:memo_app/view_model/edit/edit_state.dart';

final EditProvider = StateNotifierProvider<EditNotifier, EditState>((ref) {
  return EditNotifier(ref);
});

class EditNotifier extends StateNotifier<EditState> {
  Ref ref;
  EditNotifier(this.ref) : super(EditStateInitialize());

  void LinkingStateEdit(int number, MomoModel memo) {
    //初期化中
    state = EditStateInitializing(number: null, memo: null);

    //初期化中
    state = EditStateInitializing(number: number, memo: memo);

    //初期化完了
    state = EditStateInitialized(number: number, memo: memo);
  }

  Future<void> UpdateMemo() async {
    DatabaseNotifier _databaseController = ref.read(databaseProvider.notifier);
    Exception? error;
    try {
      if ((state.newTitle == null || state.newTitle == "") ||
          (state.newMemo == null || state.newMemo == "")) {
        return;
      }
      //初期化中
      state = EditStateInitializing(
          number: state.number,
          memo: state.memo,
          newTitle: state.newTitle,
          newMemo: state.newMemo);

      var result = await _databaseController.updateMemoDatabase(
          state.memo!.id, state.newTitle!, state.newMemo!);

      if (result) {
        print("【DB更新完了】");
      } else {
        print("【DB更新失敗】");
      }
      // 初期化完了
      state = EditStateInitialized(
          number: null, memo: null, newTitle: null, newMemo: null);
    } on Exception catch (e) {
      error = e;
      print("エラー発生：${error}");
    }
  }

  Future<void> InputTitle(String value) async {
    state = InputingTitle(
        number: state.number,
        memo: state.memo,
        newTitle: value,
        newMemo: state.newMemo);
    print(state.newTitle);
  }

  Future<void> InputMemo(String value) async {
    state = InputingMemo(
        number: state.number,
        memo: state.memo,
        newTitle: state.newTitle,
        newMemo: value);
    print(state.newMemo);
  }
}
