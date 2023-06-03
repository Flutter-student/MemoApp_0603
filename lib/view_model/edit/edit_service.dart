import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/Database/memo_app_database.dart';
import 'package:memo_app/view_model/disp/disp_state.dart';

final editProvider = StateNotifierProvider<EditNotifier, DispState>((ref) {
  return EditNotifier();
});

class EditNotifier extends StateNotifier<DispState> {
  EditNotifier() : super(DispStateInitialize());
}
