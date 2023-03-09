// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_account_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavingsAccounts {
  List<_Account> get accounts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavingsAccountsCopyWith<SavingsAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsAccountsCopyWith<$Res> {
  factory $SavingsAccountsCopyWith(
          SavingsAccounts value, $Res Function(SavingsAccounts) then) =
      _$SavingsAccountsCopyWithImpl<$Res, SavingsAccounts>;
  @useResult
  $Res call({List<_Account> accounts});
}

/// @nodoc
class _$SavingsAccountsCopyWithImpl<$Res, $Val extends SavingsAccounts>
    implements $SavingsAccountsCopyWith<$Res> {
  _$SavingsAccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<_Account>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavingsAccountsCopyWith<$Res>
    implements $SavingsAccountsCopyWith<$Res> {
  factory _$$_SavingsAccountsCopyWith(
          _$_SavingsAccounts value, $Res Function(_$_SavingsAccounts) then) =
      __$$_SavingsAccountsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<_Account> accounts});
}

/// @nodoc
class __$$_SavingsAccountsCopyWithImpl<$Res>
    extends _$SavingsAccountsCopyWithImpl<$Res, _$_SavingsAccounts>
    implements _$$_SavingsAccountsCopyWith<$Res> {
  __$$_SavingsAccountsCopyWithImpl(
      _$_SavingsAccounts _value, $Res Function(_$_SavingsAccounts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$_SavingsAccounts(
      null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<_Account>,
    ));
  }
}

/// @nodoc

class _$_SavingsAccounts extends _SavingsAccounts {
  const _$_SavingsAccounts(final List<_Account> accounts)
      : _accounts = accounts,
        super._();

  final List<_Account> _accounts;
  @override
  List<_Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'SavingsAccounts(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavingsAccounts &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavingsAccountsCopyWith<_$_SavingsAccounts> get copyWith =>
      __$$_SavingsAccountsCopyWithImpl<_$_SavingsAccounts>(this, _$identity);
}

abstract class _SavingsAccounts extends SavingsAccounts {
  const factory _SavingsAccounts(final List<_Account> accounts) =
      _$_SavingsAccounts;
  const _SavingsAccounts._() : super._();

  @override
  List<_Account> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_SavingsAccountsCopyWith<_$_SavingsAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$_Account {
  int get sum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$AccountCopyWith<_Account> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) then) =
      __$AccountCopyWithImpl<$Res, _Account>;
  @useResult
  $Res call({int sum});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res, $Val extends _Account>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$__AccountCopyWith<$Res> implements _$AccountCopyWith<$Res> {
  factory _$$__AccountCopyWith(
          _$__Account value, $Res Function(_$__Account) then) =
      __$$__AccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sum});
}

/// @nodoc
class __$$__AccountCopyWithImpl<$Res>
    extends __$AccountCopyWithImpl<$Res, _$__Account>
    implements _$$__AccountCopyWith<$Res> {
  __$$__AccountCopyWithImpl(
      _$__Account _value, $Res Function(_$__Account) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = null,
  }) {
    return _then(_$__Account(
      null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$__Account implements __Account {
  const _$__Account(this.sum);

  @override
  final int sum;

  @override
  String toString() {
    return '_Account(sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__Account &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__AccountCopyWith<_$__Account> get copyWith =>
      __$$__AccountCopyWithImpl<_$__Account>(this, _$identity);
}

abstract class __Account implements _Account {
  const factory __Account(final int sum) = _$__Account;

  @override
  int get sum;
  @override
  @JsonKey(ignore: true)
  _$$__AccountCopyWith<_$__Account> get copyWith =>
      throw _privateConstructorUsedError;
}
