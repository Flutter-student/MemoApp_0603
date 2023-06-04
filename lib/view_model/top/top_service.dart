import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/memo_model.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/model/repository/database_state.dart';
import 'package:memo_app/view_model/add/add_state.dart';
import 'package:memo_app/view_model/disp/disp_service.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';
import 'package:memo_app/view_model/top/top_state.dart';

final TopProvider = StateNotifierProvider<TopNotifier, TopState>((ref) {
  return TopNotifier(ref);
});

class TopNotifier extends StateNotifier<TopState> {
  Ref ref;
  TopNotifier(this.ref) : super(TopStateInitialize(number: null, memo: null));

  Future<void> NavigationDisp(int number, MomoModel memo) async {
    final DispNotifier _dispController = ref.read(DispProvider.notifier);
    // 初期化中
    state = TopStateInitializing(number: null, memo: null);

    state = TopStateInitializing(number: number, memo: memo);
    _dispController.LinkingStateDisp(number, memo);

    // 初期化完了
    state = TopStateInitialized(number: null, memo: null);
  }
}
