import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/memo_model.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';
import 'package:memo_app/view_model/edit/edit_service.dart';

final DispProvider = StateNotifierProvider<DispNotifier, DispState>((ref) {
  return DispNotifier(ref);
});

class DispNotifier extends StateNotifier<DispState> {
  Ref ref;
  DispNotifier(this.ref) : super(DispStateInitialize());

  void LinkingStateDisp(int number, MomoModel memo) {
    //初期化中
    state = DispStateInitializing(number: null, memo: null);

    //初期化中
    state = DispStateInitializing(number: number, memo: memo);

    //初期化完了
    state = DispStateInitialized(number: number, memo: memo);
  }

  Future<void> NavigationEdit(int number, MomoModel memo) async {
    final EditNotifier _editController = ref.read(EditProvider.notifier);
    // 初期化中
    state = DispStateInitializing(number: null, memo: null);

    state = DispStateInitializing(number: number, memo: memo);
    _editController.LinkingStateEdit(number, memo);

    // 初期化完了
    state = DispStateInitialized(number: number, memo: memo);
  }
}
