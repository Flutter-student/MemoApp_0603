import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';

final DispProvider = StateNotifierProvider<DispNotifier, DispState>((ref) {
  return DispNotifier();
});

class DispNotifier extends StateNotifier<DispState> {
  DispNotifier() : super(DispStateInitialize());
}
