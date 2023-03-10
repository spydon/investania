// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'high_score_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HighScoreEntry {
  String get name => throw _privateConstructorUsedError;
  int get totalSavings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HighScoreEntryCopyWith<HighScoreEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighScoreEntryCopyWith<$Res> {
  factory $HighScoreEntryCopyWith(
          HighScoreEntry value, $Res Function(HighScoreEntry) then) =
      _$HighScoreEntryCopyWithImpl<$Res, HighScoreEntry>;
  @useResult
  $Res call({String name, int totalSavings});
}

/// @nodoc
class _$HighScoreEntryCopyWithImpl<$Res, $Val extends HighScoreEntry>
    implements $HighScoreEntryCopyWith<$Res> {
  _$HighScoreEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalSavings = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalSavings: null == totalSavings
          ? _value.totalSavings
          : totalSavings // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HighScoreEntryCopyWith<$Res>
    implements $HighScoreEntryCopyWith<$Res> {
  factory _$$_HighScoreEntryCopyWith(
          _$_HighScoreEntry value, $Res Function(_$_HighScoreEntry) then) =
      __$$_HighScoreEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int totalSavings});
}

/// @nodoc
class __$$_HighScoreEntryCopyWithImpl<$Res>
    extends _$HighScoreEntryCopyWithImpl<$Res, _$_HighScoreEntry>
    implements _$$_HighScoreEntryCopyWith<$Res> {
  __$$_HighScoreEntryCopyWithImpl(
      _$_HighScoreEntry _value, $Res Function(_$_HighScoreEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalSavings = null,
  }) {
    return _then(_$_HighScoreEntry(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalSavings: null == totalSavings
          ? _value.totalSavings
          : totalSavings // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HighScoreEntry implements _HighScoreEntry {
  const _$_HighScoreEntry({required this.name, required this.totalSavings});

  @override
  final String name;
  @override
  final int totalSavings;

  @override
  String toString() {
    return 'HighScoreEntry(name: $name, totalSavings: $totalSavings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HighScoreEntry &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalSavings, totalSavings) ||
                other.totalSavings == totalSavings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, totalSavings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HighScoreEntryCopyWith<_$_HighScoreEntry> get copyWith =>
      __$$_HighScoreEntryCopyWithImpl<_$_HighScoreEntry>(this, _$identity);
}

abstract class _HighScoreEntry implements HighScoreEntry {
  const factory _HighScoreEntry(
      {required final String name,
      required final int totalSavings}) = _$_HighScoreEntry;

  @override
  String get name;
  @override
  int get totalSavings;
  @override
  @JsonKey(ignore: true)
  _$$_HighScoreEntryCopyWith<_$_HighScoreEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
