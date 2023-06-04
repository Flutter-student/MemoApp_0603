import 'package:memo_app/model/memo_model.dart';

class DispState {
  final int? number;
  final MomoModel? memo;
  DispState({
    required this.number,
    required this.memo,
  });
}

class DispStateInitialize extends DispState {
  DispStateInitialize({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期化";
}

class DispStateInitializing extends DispState {
  DispStateInitializing({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期中";
}

class DispStateInitialized extends DispState {
  DispStateInitialized({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期完了";
}
