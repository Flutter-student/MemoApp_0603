import 'package:memo_app/model/memo_model.dart';

class EditState {
  final int? number;
  final MomoModel? memo;
  final String? newTitle;
  final String? newMemo;
  EditState({
    required this.number,
    required this.memo,
    this.newTitle,
    this.newMemo,
  });
}

class EditStateInitialize extends EditState {
  EditStateInitialize({
    number,
    memo,
    newTitle,
    newMemo,
  }) : super(number: number, memo: memo, newTitle: newTitle, newMemo: newMemo);

  @override
  String toString() => "初期化";
}

class EditStateInitializing extends EditState {
  EditStateInitializing({
    number,
    memo,
    newTitle,
    newMemo,
  }) : super(number: number, memo: memo, newTitle: newTitle, newMemo: newMemo);

  @override
  String toString() => "初期中";
}

class EditStateInitialized extends EditState {
  EditStateInitialized({
    number,
    memo,
    newTitle,
    newMemo,
  }) : super(number: number, memo: memo, newTitle: newTitle, newMemo: newMemo);

  @override
  String toString() => "初期完了";
}

class InputingTitle extends EditState {
  InputingTitle({
    number,
    memo,
    newTitle,
    newMemo,
  }) : super(number: number, memo: memo, newTitle: newTitle, newMemo: newMemo);

  @override
  String toString() => "タイトル入力中";
}

class InputingMemo extends EditState {
  InputingMemo({
    number,
    memo,
    newTitle,
    newMemo,
  }) : super(number: number, memo: memo, newTitle: newTitle, newMemo: newMemo);

  @override
  String toString() => "メモ入力中";
}
