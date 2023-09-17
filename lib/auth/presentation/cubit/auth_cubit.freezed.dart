// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoggingInCopyWith<$Res> {
  factory _$$_LoggingInCopyWith(
          _$_LoggingIn value, $Res Function(_$_LoggingIn) then) =
      __$$_LoggingInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggingInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoggingIn>
    implements _$$_LoggingInCopyWith<$Res> {
  __$$_LoggingInCopyWithImpl(
      _$_LoggingIn _value, $Res Function(_$_LoggingIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoggingIn implements _LoggingIn {
  const _$_LoggingIn();

  @override
  String toString() {
    return 'AuthState.loggingIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggingIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return loggingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return loggingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return loggingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loggingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn(this);
    }
    return orElse();
  }
}

abstract class _LoggingIn implements AuthState {
  const factory _LoggingIn() = _$_LoggingIn;
}

/// @nodoc
abstract class _$$_RegisteringCopyWith<$Res> {
  factory _$$_RegisteringCopyWith(
          _$_Registering value, $Res Function(_$_Registering) then) =
      __$$_RegisteringCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisteringCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Registering>
    implements _$$_RegisteringCopyWith<$Res> {
  __$$_RegisteringCopyWithImpl(
      _$_Registering _value, $Res Function(_$_Registering) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Registering implements _Registering {
  const _$_Registering();

  @override
  String toString() {
    return 'AuthState.registering()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Registering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return registering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return registering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return registering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return registering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering(this);
    }
    return orElse();
  }
}

abstract class _Registering implements AuthState {
  const factory _Registering() = _$_Registering;
}

/// @nodoc
abstract class _$$_LoginsuccessCopyWith<$Res> {
  factory _$$_LoginsuccessCopyWith(
          _$_Loginsuccess value, $Res Function(_$_Loginsuccess) then) =
      __$$_LoginsuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$_LoginsuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Loginsuccess>
    implements _$$_LoginsuccessCopyWith<$Res> {
  __$$_LoginsuccessCopyWithImpl(
      _$_Loginsuccess _value, $Res Function(_$_Loginsuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Loginsuccess(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_Loginsuccess implements _Loginsuccess {
  const _$_Loginsuccess(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.loginsuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loginsuccess &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginsuccessCopyWith<_$_Loginsuccess> get copyWith =>
      __$$_LoginsuccessCopyWithImpl<_$_Loginsuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return loginsuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return loginsuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loginsuccess != null) {
      return loginsuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return loginsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loginsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loginsuccess != null) {
      return loginsuccess(this);
    }
    return orElse();
  }
}

abstract class _Loginsuccess implements AuthState {
  const factory _Loginsuccess(final UserModel user) = _$_Loginsuccess;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$_LoginsuccessCopyWith<_$_Loginsuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegistersuccessCopyWith<$Res> {
  factory _$$_RegistersuccessCopyWith(
          _$_Registersuccess value, $Res Function(_$_Registersuccess) then) =
      __$$_RegistersuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$_RegistersuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Registersuccess>
    implements _$$_RegistersuccessCopyWith<$Res> {
  __$$_RegistersuccessCopyWithImpl(
      _$_Registersuccess _value, $Res Function(_$_Registersuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Registersuccess(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_Registersuccess implements _Registersuccess {
  const _$_Registersuccess(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.registersuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Registersuccess &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistersuccessCopyWith<_$_Registersuccess> get copyWith =>
      __$$_RegistersuccessCopyWithImpl<_$_Registersuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return registersuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return registersuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (registersuccess != null) {
      return registersuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return registersuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return registersuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (registersuccess != null) {
      return registersuccess(this);
    }
    return orElse();
  }
}

abstract class _Registersuccess implements AuthState {
  const factory _Registersuccess(final UserModel user) = _$_Registersuccess;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$_RegistersuccessCopyWith<_$_Registersuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$_Error(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function() registering,
    required TResult Function(UserModel user) loginsuccess,
    required TResult Function(UserModel user) registersuccess,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function()? registering,
    TResult? Function(UserModel user)? loginsuccess,
    TResult? Function(UserModel user)? registersuccess,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function()? registering,
    TResult Function(UserModel user)? loginsuccess,
    TResult Function(UserModel user)? registersuccess,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Loginsuccess value) loginsuccess,
    required TResult Function(_Registersuccess value) registersuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Loginsuccess value)? loginsuccess,
    TResult? Function(_Registersuccess value)? registersuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_Registering value)? registering,
    TResult Function(_Loginsuccess value)? loginsuccess,
    TResult Function(_Registersuccess value)? registersuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String errorMessage) = _$_Error;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
