import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_model.freezed.dart';

@freezed
class MomoModel with _$MomoModel {
  factory MomoModel({
    required String title,
    required String memo,
  }) = _MomoModel;
}
