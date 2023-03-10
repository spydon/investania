// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Account {
  int get sum => throw _privateConstructorUsedError;
  int get roi => throw _privateConstructorUsedError;
  double get roiPercentage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call({int sum, int roi, double roiPercentage});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
    Object? roi = null,
    Object? roiPercentage = null,
  }) {
    return _then(_value.copyWith(
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      roi: null == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as int,
      roiPercentage: null == roiPercentage
          ? _value.roiPercentage
          : roiPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sum, int roi, double roiPercentage});
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$_Account>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
    Object? roi = null,
    Object? roiPercentage = null,
  }) {
    return _then(_$_Account(
      null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
      null == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as int,
      null == roiPercentage
          ? _value.roiPercentage
          : roiPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Account implements _Account {
  const _$_Account(this.sum, this.roi, this.roiPercentage);

  @override
  final int sum;
  @override
  final int roi;
  @override
  final double roiPercentage;

  @override
  String toString() {
    return 'Account(sum: $sum, roi: $roi, roiPercentage: $roiPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.roiPercentage, roiPercentage) ||
                other.roiPercentage == roiPercentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sum, roi, roiPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);
}

abstract class _Account implements Account {
  const factory _Account(
      final int sum, final int roi, final double roiPercentage) = _$_Account;

  @override
  int get sum;
  @override
  int get roi;
  @override
  double get roiPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}
