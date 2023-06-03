import 'package:memo_app/model/memo_model.dart';

class EditState {
  final List<MomoModel>? memoList;
  EditState({
    required this.memoList,
  });
}

class EditStateInitialize extends EditState {
  EditStateInitialize({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期化";
}

class DispStateInitializing extends EditState {
  DispStateInitializing({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期中";
}

class DispStateInitialized extends EditState {
  DispStateInitialized({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期完了";
}
