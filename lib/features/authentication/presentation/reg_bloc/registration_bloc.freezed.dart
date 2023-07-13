// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) register,
    required TResult Function() toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? register,
    TResult? Function()? toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? register,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationEvent value) register,
    required TResult Function(_ToInitialRegistrationEvent value) toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegistrationEvent value)? register,
    TResult? Function(_ToInitialRegistrationEvent value)? toInitial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationEvent value)? register,
    TResult Function(_ToInitialRegistrationEvent value)? toInitial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
          RegistrationEvent value, $Res Function(RegistrationEvent) then) =
      _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RegistrationEventCopyWith<$Res> {
  factory _$$_RegistrationEventCopyWith(_$_RegistrationEvent value,
          $Res Function(_$_RegistrationEvent) then) =
      __$$_RegistrationEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$_RegistrationEventCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$_RegistrationEvent>
    implements _$$_RegistrationEventCopyWith<$Res> {
  __$$_RegistrationEventCopyWithImpl(
      _$_RegistrationEvent _value, $Res Function(_$_RegistrationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$_RegistrationEvent(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationEvent extends _RegistrationEvent {
  const _$_RegistrationEvent({required this.login, required this.password})
      : super._();

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'RegistrationEvent.register(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationEvent &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationEventCopyWith<_$_RegistrationEvent> get copyWith =>
      __$$_RegistrationEventCopyWithImpl<_$_RegistrationEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) register,
    required TResult Function() toInitial,
  }) {
    return register(login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? register,
    TResult? Function()? toInitial,
  }) {
    return register?.call(login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? register,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(login, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationEvent value) register,
    required TResult Function(_ToInitialRegistrationEvent value) toInitial,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegistrationEvent value)? register,
    TResult? Function(_ToInitialRegistrationEvent value)? toInitial,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationEvent value)? register,
    TResult Function(_ToInitialRegistrationEvent value)? toInitial,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _RegistrationEvent extends RegistrationEvent {
  const factory _RegistrationEvent(
      {required final String login,
      required final String password}) = _$_RegistrationEvent;
  const _RegistrationEvent._() : super._();

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$_RegistrationEventCopyWith<_$_RegistrationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToInitialRegistrationEventCopyWith<$Res> {
  factory _$$_ToInitialRegistrationEventCopyWith(
          _$_ToInitialRegistrationEvent value,
          $Res Function(_$_ToInitialRegistrationEvent) then) =
      __$$_ToInitialRegistrationEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToInitialRegistrationEventCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$_ToInitialRegistrationEvent>
    implements _$$_ToInitialRegistrationEventCopyWith<$Res> {
  __$$_ToInitialRegistrationEventCopyWithImpl(
      _$_ToInitialRegistrationEvent _value,
      $Res Function(_$_ToInitialRegistrationEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToInitialRegistrationEvent extends _ToInitialRegistrationEvent {
  const _$_ToInitialRegistrationEvent() : super._();

  @override
  String toString() {
    return 'RegistrationEvent.toInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToInitialRegistrationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) register,
    required TResult Function() toInitial,
  }) {
    return toInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? register,
    TResult? Function()? toInitial,
  }) {
    return toInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? register,
    TResult Function()? toInitial,
    required TResult orElse(),
  }) {
    if (toInitial != null) {
      return toInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationEvent value) register,
    required TResult Function(_ToInitialRegistrationEvent value) toInitial,
  }) {
    return toInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegistrationEvent value)? register,
    TResult? Function(_ToInitialRegistrationEvent value)? toInitial,
  }) {
    return toInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationEvent value)? register,
    TResult Function(_ToInitialRegistrationEvent value)? toInitial,
    required TResult orElse(),
  }) {
    if (toInitial != null) {
      return toInitial(this);
    }
    return orElse();
  }
}

abstract class _ToInitialRegistrationEvent extends RegistrationEvent {
  const factory _ToInitialRegistrationEvent() = _$_ToInitialRegistrationEvent;
  const _ToInitialRegistrationEvent._() : super._();
}

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProcess,
    required TResult Function() successful,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProcess,
    TResult? Function()? successful,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProcess,
    TResult Function()? successful,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialRegistrationState value) initial,
    required TResult Function(_InProcessRegistrationState value) inProcess,
    required TResult Function(_SuccessfulRegistrationState value) successful,
    required TResult Function(_ErrorRegistrationState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialRegistrationState value)? initial,
    TResult? Function(_InProcessRegistrationState value)? inProcess,
    TResult? Function(_SuccessfulRegistrationState value)? successful,
    TResult? Function(_ErrorRegistrationState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialRegistrationState value)? initial,
    TResult Function(_InProcessRegistrationState value)? inProcess,
    TResult Function(_SuccessfulRegistrationState value)? successful,
    TResult Function(_ErrorRegistrationState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialRegistrationStateCopyWith<$Res> {
  factory _$$_InitialRegistrationStateCopyWith(
          _$_InitialRegistrationState value,
          $Res Function(_$_InitialRegistrationState) then) =
      __$$_InitialRegistrationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialRegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_InitialRegistrationState>
    implements _$$_InitialRegistrationStateCopyWith<$Res> {
  __$$_InitialRegistrationStateCopyWithImpl(_$_InitialRegistrationState _value,
      $Res Function(_$_InitialRegistrationState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialRegistrationState extends _InitialRegistrationState {
  const _$_InitialRegistrationState() : super._();

  @override
  String toString() {
    return 'RegistrationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialRegistrationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProcess,
    required TResult Function() successful,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProcess,
    TResult? Function()? successful,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProcess,
    TResult Function()? successful,
    TResult Function(String message)? error,
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
    required TResult Function(_InitialRegistrationState value) initial,
    required TResult Function(_InProcessRegistrationState value) inProcess,
    required TResult Function(_SuccessfulRegistrationState value) successful,
    required TResult Function(_ErrorRegistrationState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialRegistrationState value)? initial,
    TResult? Function(_InProcessRegistrationState value)? inProcess,
    TResult? Function(_SuccessfulRegistrationState value)? successful,
    TResult? Function(_ErrorRegistrationState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialRegistrationState value)? initial,
    TResult Function(_InProcessRegistrationState value)? inProcess,
    TResult Function(_SuccessfulRegistrationState value)? successful,
    TResult Function(_ErrorRegistrationState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialRegistrationState extends RegistrationState {
  const factory _InitialRegistrationState() = _$_InitialRegistrationState;
  const _InitialRegistrationState._() : super._();
}

/// @nodoc
abstract class _$$_InProcessRegistrationStateCopyWith<$Res> {
  factory _$$_InProcessRegistrationStateCopyWith(
          _$_InProcessRegistrationState value,
          $Res Function(_$_InProcessRegistrationState) then) =
      __$$_InProcessRegistrationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InProcessRegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_InProcessRegistrationState>
    implements _$$_InProcessRegistrationStateCopyWith<$Res> {
  __$$_InProcessRegistrationStateCopyWithImpl(
      _$_InProcessRegistrationState _value,
      $Res Function(_$_InProcessRegistrationState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InProcessRegistrationState extends _InProcessRegistrationState {
  const _$_InProcessRegistrationState() : super._();

  @override
  String toString() {
    return 'RegistrationState.inProcess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InProcessRegistrationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProcess,
    required TResult Function() successful,
    required TResult Function(String message) error,
  }) {
    return inProcess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProcess,
    TResult? Function()? successful,
    TResult? Function(String message)? error,
  }) {
    return inProcess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProcess,
    TResult Function()? successful,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialRegistrationState value) initial,
    required TResult Function(_InProcessRegistrationState value) inProcess,
    required TResult Function(_SuccessfulRegistrationState value) successful,
    required TResult Function(_ErrorRegistrationState value) error,
  }) {
    return inProcess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialRegistrationState value)? initial,
    TResult? Function(_InProcessRegistrationState value)? inProcess,
    TResult? Function(_SuccessfulRegistrationState value)? successful,
    TResult? Function(_ErrorRegistrationState value)? error,
  }) {
    return inProcess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialRegistrationState value)? initial,
    TResult Function(_InProcessRegistrationState value)? inProcess,
    TResult Function(_SuccessfulRegistrationState value)? successful,
    TResult Function(_ErrorRegistrationState value)? error,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess(this);
    }
    return orElse();
  }
}

abstract class _InProcessRegistrationState extends RegistrationState {
  const factory _InProcessRegistrationState() = _$_InProcessRegistrationState;
  const _InProcessRegistrationState._() : super._();
}

/// @nodoc
abstract class _$$_SuccessfulRegistrationStateCopyWith<$Res> {
  factory _$$_SuccessfulRegistrationStateCopyWith(
          _$_SuccessfulRegistrationState value,
          $Res Function(_$_SuccessfulRegistrationState) then) =
      __$$_SuccessfulRegistrationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessfulRegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res,
        _$_SuccessfulRegistrationState>
    implements _$$_SuccessfulRegistrationStateCopyWith<$Res> {
  __$$_SuccessfulRegistrationStateCopyWithImpl(
      _$_SuccessfulRegistrationState _value,
      $Res Function(_$_SuccessfulRegistrationState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccessfulRegistrationState extends _SuccessfulRegistrationState {
  const _$_SuccessfulRegistrationState() : super._();

  @override
  String toString() {
    return 'RegistrationState.successful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessfulRegistrationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProcess,
    required TResult Function() successful,
    required TResult Function(String message) error,
  }) {
    return successful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProcess,
    TResult? Function()? successful,
    TResult? Function(String message)? error,
  }) {
    return successful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProcess,
    TResult Function()? successful,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialRegistrationState value) initial,
    required TResult Function(_InProcessRegistrationState value) inProcess,
    required TResult Function(_SuccessfulRegistrationState value) successful,
    required TResult Function(_ErrorRegistrationState value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialRegistrationState value)? initial,
    TResult? Function(_InProcessRegistrationState value)? inProcess,
    TResult? Function(_SuccessfulRegistrationState value)? successful,
    TResult? Function(_ErrorRegistrationState value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialRegistrationState value)? initial,
    TResult Function(_InProcessRegistrationState value)? inProcess,
    TResult Function(_SuccessfulRegistrationState value)? successful,
    TResult Function(_ErrorRegistrationState value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _SuccessfulRegistrationState extends RegistrationState {
  const factory _SuccessfulRegistrationState() = _$_SuccessfulRegistrationState;
  const _SuccessfulRegistrationState._() : super._();
}

/// @nodoc
abstract class _$$_ErrorRegistrationStateCopyWith<$Res> {
  factory _$$_ErrorRegistrationStateCopyWith(_$_ErrorRegistrationState value,
          $Res Function(_$_ErrorRegistrationState) then) =
      __$$_ErrorRegistrationStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorRegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_ErrorRegistrationState>
    implements _$$_ErrorRegistrationStateCopyWith<$Res> {
  __$$_ErrorRegistrationStateCopyWithImpl(_$_ErrorRegistrationState _value,
      $Res Function(_$_ErrorRegistrationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ErrorRegistrationState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorRegistrationState extends _ErrorRegistrationState {
  const _$_ErrorRegistrationState({this.message = 'Произошла ошибка'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'RegistrationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorRegistrationState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorRegistrationStateCopyWith<_$_ErrorRegistrationState> get copyWith =>
      __$$_ErrorRegistrationStateCopyWithImpl<_$_ErrorRegistrationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProcess,
    required TResult Function() successful,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProcess,
    TResult? Function()? successful,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProcess,
    TResult Function()? successful,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialRegistrationState value) initial,
    required TResult Function(_InProcessRegistrationState value) inProcess,
    required TResult Function(_SuccessfulRegistrationState value) successful,
    required TResult Function(_ErrorRegistrationState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialRegistrationState value)? initial,
    TResult? Function(_InProcessRegistrationState value)? inProcess,
    TResult? Function(_SuccessfulRegistrationState value)? successful,
    TResult? Function(_ErrorRegistrationState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialRegistrationState value)? initial,
    TResult Function(_InProcessRegistrationState value)? inProcess,
    TResult Function(_SuccessfulRegistrationState value)? successful,
    TResult Function(_ErrorRegistrationState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorRegistrationState extends RegistrationState {
  const factory _ErrorRegistrationState({final String message}) =
      _$_ErrorRegistrationState;
  const _ErrorRegistrationState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorRegistrationStateCopyWith<_$_ErrorRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}
