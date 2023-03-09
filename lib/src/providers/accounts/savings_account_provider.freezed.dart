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
  List<Account> get accounts => throw _privateConstructorUsedError;

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
  $Res call({List<Account> accounts});
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
              as List<Account>,
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
  $Res call({List<Account> accounts});
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
              as List<Account>,
    ));
  }
}

/// @nodoc

class _$_SavingsAccounts extends _SavingsAccounts {
  const _$_SavingsAccounts(final List<Account> accounts)
      : _accounts = accounts,
        super._();

  final List<Account> _accounts;
  @override
  List<Account> get accounts {
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
  const factory _SavingsAccounts(final List<Account> accounts) =
      _$_SavingsAccounts;
  const _SavingsAccounts._() : super._();

  @override
  List<Account> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_SavingsAccountsCopyWith<_$_SavingsAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}
