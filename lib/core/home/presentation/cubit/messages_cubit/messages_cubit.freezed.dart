// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessagesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res, MessagesState>;
}

/// @nodoc
class _$MessagesStateCopyWithImpl<$Res, $Val extends MessagesState>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

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
    extends _$MessagesStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'MessagesState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MessagesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'MessagesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MessagesState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedConversationsCopyWith<$Res> {
  factory _$$_LoadedConversationsCopyWith(_$_LoadedConversations value,
          $Res Function(_$_LoadedConversations) then) =
      __$$_LoadedConversationsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConversationModel> conversations});
}

/// @nodoc
class __$$_LoadedConversationsCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_LoadedConversations>
    implements _$$_LoadedConversationsCopyWith<$Res> {
  __$$_LoadedConversationsCopyWithImpl(_$_LoadedConversations _value,
      $Res Function(_$_LoadedConversations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_$_LoadedConversations(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationModel>,
    ));
  }
}

/// @nodoc

class _$_LoadedConversations implements _LoadedConversations {
  const _$_LoadedConversations(
      {required final List<ConversationModel> conversations})
      : _conversations = conversations;

  final List<ConversationModel> _conversations;
  @override
  List<ConversationModel> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  String toString() {
    return 'MessagesState.loadedConversations(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedConversations &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedConversationsCopyWith<_$_LoadedConversations> get copyWith =>
      __$$_LoadedConversationsCopyWithImpl<_$_LoadedConversations>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return loadedConversations(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return loadedConversations?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loadedConversations != null) {
      return loadedConversations(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loadedConversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loadedConversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedConversations != null) {
      return loadedConversations(this);
    }
    return orElse();
  }
}

abstract class _LoadedConversations implements MessagesState {
  const factory _LoadedConversations(
          {required final List<ConversationModel> conversations}) =
      _$_LoadedConversations;

  List<ConversationModel> get conversations;
  @JsonKey(ignore: true)
  _$$_LoadedConversationsCopyWith<_$_LoadedConversations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MsgSendingCopyWith<$Res> {
  factory _$$_MsgSendingCopyWith(
          _$_MsgSending value, $Res Function(_$_MsgSending) then) =
      __$$_MsgSendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MsgSendingCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_MsgSending>
    implements _$$_MsgSendingCopyWith<$Res> {
  __$$_MsgSendingCopyWithImpl(
      _$_MsgSending _value, $Res Function(_$_MsgSending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MsgSending implements _MsgSending {
  const _$_MsgSending();

  @override
  String toString() {
    return 'MessagesState.msgSending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MsgSending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return msgSending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return msgSending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (msgSending != null) {
      return msgSending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return msgSending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return msgSending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (msgSending != null) {
      return msgSending(this);
    }
    return orElse();
  }
}

abstract class _MsgSending implements MessagesState {
  const factory _MsgSending() = _$_MsgSending;
}

/// @nodoc
abstract class _$$_MsgSentCopyWith<$Res> {
  factory _$$_MsgSentCopyWith(
          _$_MsgSent value, $Res Function(_$_MsgSent) then) =
      __$$_MsgSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MsgSentCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_MsgSent>
    implements _$$_MsgSentCopyWith<$Res> {
  __$$_MsgSentCopyWithImpl(_$_MsgSent _value, $Res Function(_$_MsgSent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MsgSent implements _MsgSent {
  const _$_MsgSent();

  @override
  String toString() {
    return 'MessagesState.msgSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MsgSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return msgSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return msgSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (msgSent != null) {
      return msgSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return msgSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return msgSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (msgSent != null) {
      return msgSent(this);
    }
    return orElse();
  }
}

abstract class _MsgSent implements MessagesState {
  const factory _MsgSent() = _$_MsgSent;
}

/// @nodoc
abstract class _$$_MessageLoadedCopyWith<$Res> {
  factory _$$_MessageLoadedCopyWith(
          _$_MessageLoaded value, $Res Function(_$_MessageLoaded) then) =
      __$$_MessageLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MessageModel> messages});
}

/// @nodoc
class __$$_MessageLoadedCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$_MessageLoaded>
    implements _$$_MessageLoadedCopyWith<$Res> {
  __$$_MessageLoadedCopyWithImpl(
      _$_MessageLoaded _value, $Res Function(_$_MessageLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_MessageLoaded(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc

class _$_MessageLoaded implements _MessageLoaded {
  const _$_MessageLoaded({required final List<MessageModel> messages})
      : _messages = messages;

  final List<MessageModel> _messages;
  @override
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessagesState.messageLoaded(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageLoaded &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageLoadedCopyWith<_$_MessageLoaded> get copyWith =>
      __$$_MessageLoadedCopyWithImpl<_$_MessageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return messageLoaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return messageLoaded?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (messageLoaded != null) {
      return messageLoaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return messageLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return messageLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (messageLoaded != null) {
      return messageLoaded(this);
    }
    return orElse();
  }
}

abstract class _MessageLoaded implements MessagesState {
  const factory _MessageLoaded({required final List<MessageModel> messages}) =
      _$_MessageLoaded;

  List<MessageModel> get messages;
  @JsonKey(ignore: true)
  _$$_MessageLoadedCopyWith<_$_MessageLoaded> get copyWith =>
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
    extends _$MessagesStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$_Error(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'MessagesState.error(errorMessage: $errorMessage)';
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
    required TResult Function() loading,
    required TResult Function(List<ConversationModel> conversations)
        loadedConversations,
    required TResult Function() msgSending,
    required TResult Function() msgSent,
    required TResult Function(List<MessageModel> messages) messageLoaded,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult? Function()? msgSending,
    TResult? Function()? msgSent,
    TResult? Function(List<MessageModel> messages)? messageLoaded,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ConversationModel> conversations)?
        loadedConversations,
    TResult Function()? msgSending,
    TResult Function()? msgSent,
    TResult Function(List<MessageModel> messages)? messageLoaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedConversations value) loadedConversations,
    required TResult Function(_MsgSending value) msgSending,
    required TResult Function(_MsgSent value) msgSent,
    required TResult Function(_MessageLoaded value) messageLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedConversations value)? loadedConversations,
    TResult? Function(_MsgSending value)? msgSending,
    TResult? Function(_MsgSent value)? msgSent,
    TResult? Function(_MessageLoaded value)? messageLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedConversations value)? loadedConversations,
    TResult Function(_MsgSending value)? msgSending,
    TResult Function(_MsgSent value)? msgSent,
    TResult Function(_MessageLoaded value)? messageLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MessagesState {
  const factory _Error({required final String errorMessage}) = _$_Error;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
