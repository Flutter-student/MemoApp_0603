// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MomoModel {
  String get title => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MomoModelCopyWith<MomoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomoModelCopyWith<$Res> {
  factory $MomoModelCopyWith(MomoModel value, $Res Function(MomoModel) then) =
      _$MomoModelCopyWithImpl<$Res, MomoModel>;
  @useResult
  $Res call({String title, String memo, DateTime createAt});
}

/// @nodoc
class _$MomoModelCopyWithImpl<$Res, $Val extends MomoModel>
    implements $MomoModelCopyWith<$Res> {
  _$MomoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? memo = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MomoModelCopyWith<$Res> implements $MomoModelCopyWith<$Res> {
  factory _$$_MomoModelCopyWith(
          _$_MomoModel value, $Res Function(_$_MomoModel) then) =
      __$$_MomoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String memo, DateTime createAt});
}

/// @nodoc
class __$$_MomoModelCopyWithImpl<$Res>
    extends _$MomoModelCopyWithImpl<$Res, _$_MomoModel>
    implements _$$_MomoModelCopyWith<$Res> {
  __$$_MomoModelCopyWithImpl(
      _$_MomoModel _value, $Res Function(_$_MomoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? memo = null,
    Object? createAt = null,
  }) {
    return _then(_$_MomoModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_MomoModel implements _MomoModel {
  _$_MomoModel(
      {required this.title, required this.memo, required this.createAt});

  @override
  final String title;
  @override
  final String memo;
  @override
  final DateTime createAt;

  @override
  String toString() {
    return 'MomoModel(title: $title, memo: $memo, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MomoModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, memo, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MomoModelCopyWith<_$_MomoModel> get copyWith =>
      __$$_MomoModelCopyWithImpl<_$_MomoModel>(this, _$identity);
}

abstract class _MomoModel implements MomoModel {
  factory _MomoModel(
      {required final String title,
      required final String memo,
      required final DateTime createAt}) = _$_MomoModel;

  @override
  String get title;
  @override
  String get memo;
  @override
  DateTime get createAt;
  @override
  @JsonKey(ignore: true)
  _$$_MomoModelCopyWith<_$_MomoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
