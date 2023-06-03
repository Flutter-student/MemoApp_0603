import 'package:memo_app/model/memo_model.dart';

class AddState {
  final String? title;
  final String? memo;
  AddState({
    this.title,
    this.memo,
  });
}

class AddStateInitialize extends AddState {
  AddStateInitialize({
    title,
    memo,
  }) : super(title: title, memo: memo);

  @override
  String toString() => "初期化";
}

class AddStateInitializing extends AddState {
  AddStateInitializing({
    title,
    memo,
  }) : super(title: title, memo: memo);

  @override
  String toString() => "初期中";
}

class AddStateInitialized extends AddState {
  AddStateInitialized({
    title,
    memo,
  }) : super(title: title, memo: memo);

  @override
  String toString() => "初期完了";
}

class InputingTitle extends AddState {
  InputingTitle({
    title,
    memo,
  }) : super(title: title, memo: memo);

  @override
  String toString() => "タイトル入力中";
}

class InputingMemo extends AddState {
  InputingMemo({
    title,
    memo,
  }) : super(title: title, memo: memo);

  @override
  String toString() => "メモ入力中";
}
