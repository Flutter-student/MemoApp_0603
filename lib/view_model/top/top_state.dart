import 'package:memo_app/model/memo_model.dart';

class TopState {
  final int? number;
  final MomoModel? memo;
  TopState({
    required this.number,
    required this.memo,
  });
}

class TopStateInitialize extends TopState {
  TopStateInitialize({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期化";
}

class TopStateInitializing extends TopState {
  TopStateInitializing({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期中";
}

class TopStateInitialized extends TopState {
  TopStateInitialized({
    number,
    memo,
  }) : super(number: number, memo: memo);

  @override
  String toString() => "初期完了";
}
