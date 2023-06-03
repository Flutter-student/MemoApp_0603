import 'package:memo_app/model/memo_model.dart';

class DatabaseState {
  final List<MomoModel>? memoList;
  DatabaseState({
    required this.memoList,
  });
}

class DatabaseStateInitialize extends DatabaseState {
  DatabaseStateInitialize({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期化";
}

class DatabaseStateInitializing extends DatabaseState {
  DatabaseStateInitializing({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期中";
}

class DatabaseStateInitialized extends DatabaseState {
  DatabaseStateInitialized({
    memoList,
  }) : super(memoList: memoList);

  @override
  String toString() => "初期完了";
}
