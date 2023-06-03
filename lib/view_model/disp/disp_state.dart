import 'package:memo_app/model/memo_model.dart';

class DispState {
  final List<MomoModel>? memoList;
  DispState({
    required this.memoList,
  });
}

class DispStateInitialize extends DispState {
  DispStateInitialize({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期化";
}

class DispStateInitializing extends DispState {
  DispStateInitializing({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期中";
}

class DispStateInitialized extends DispState {
  DispStateInitialized({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期完了";
}
