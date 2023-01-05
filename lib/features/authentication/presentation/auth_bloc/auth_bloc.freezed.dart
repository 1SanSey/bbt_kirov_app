// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) logIn,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogInAuthEvent value) logIn,
    required TResult Function(_LogOutAuthEvent value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogInAuthEvent value)? logIn,
    TResult? Function(_LogOutAuthEvent value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogInAuthEvent value)? logIn,
    TResult Function(_LogOutAuthEvent value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LogInAuthEventCopyWith<$Res> {
  factory _$$_LogInAuthEventCopyWith(
          _$_LogInAuthEvent value, $Res Function(_$_LogInAuthEvent) then) =
      __$$_LogInAuthEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$_LogInAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LogInAuthEvent>
    implements _$$_LogInAuthEventCopyWith<$Res> {
  __$$_LogInAuthEventCopyWithImpl(
      _$_LogInAuthEvent _value, $Res Function(_$_LogInAuthEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$_LogInAuthEvent(
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

class _$_LogInAuthEvent extends _LogInAuthEvent {
  const _$_LogInAuthEvent({required this.login, required this.password})
      : super._();

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.logIn(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogInAuthEvent &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogInAuthEventCopyWith<_$_LogInAuthEvent> get copyWith =>
      __$$_LogInAuthEventCopyWithImpl<_$_LogInAuthEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) logIn,
    required TResult Function() logOut,
  }) {
    return logIn(login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? logOut,
  }) {
    return logIn?.call(login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(login, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogInAuthEvent value) logIn,
    required TResult Function(_LogOutAuthEvent value) logOut,
  }) {
    return logIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogInAuthEvent value)? logIn,
    TResult? Function(_LogOutAuthEvent value)? logOut,
  }) {
    return logIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogInAuthEvent value)? logIn,
    TResult Function(_LogOutAuthEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(this);
    }
    return orElse();
  }
}

abstract class _LogInAuthEvent extends AuthEvent {
  const factory _LogInAuthEvent(
      {required final String login,
      required final String password}) = _$_LogInAuthEvent;
  const _LogInAuthEvent._() : super._();

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$_LogInAuthEventCopyWith<_$_LogInAuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogOutAuthEventCopyWith<$Res> {
  factory _$$_LogOutAuthEventCopyWith(
          _$_LogOutAuthEvent value, $Res Function(_$_LogOutAuthEvent) then) =
      __$$_LogOutAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LogOutAuthEvent>
    implements _$$_LogOutAuthEventCopyWith<$Res> {
  __$$_LogOutAuthEventCopyWithImpl(
      _$_LogOutAuthEvent _value, $Res Function(_$_LogOutAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LogOutAuthEvent extends _LogOutAuthEvent {
  const _$_LogOutAuthEvent() : super._();

  @override
  String toString() {
    return 'AuthEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOutAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) logIn,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogInAuthEvent value) logIn,
    required TResult Function(_LogOutAuthEvent value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogInAuthEvent value)? logIn,
    TResult? Function(_LogOutAuthEvent value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogInAuthEvent value)? logIn,
    TResult Function(_LogOutAuthEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOutAuthEvent extends AuthEvent {
  const factory _LogOutAuthEvent() = _$_LogOutAuthEvent;
  const _LogOutAuthEvent._() : super._();
}

/// @nodoc
mixin _$AuthState {
  UserEntity get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
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
abstract class _$$_AuthenticatedAuthStateCopyWith<$Res> {
  factory _$$_AuthenticatedAuthStateCopyWith(_$_AuthenticatedAuthState value,
          $Res Function(_$_AuthenticatedAuthState) then) =
      __$$_AuthenticatedAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticatedUser user});
}

/// @nodoc
class __$$_AuthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthenticatedAuthState>
    implements _$$_AuthenticatedAuthStateCopyWith<$Res> {
  __$$_AuthenticatedAuthStateCopyWithImpl(_$_AuthenticatedAuthState _value,
      $Res Function(_$_AuthenticatedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthenticatedUser,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedAuthState extends _AuthenticatedAuthState {
  const _$_AuthenticatedAuthState({required this.user}) : super._();

  @override
  final AuthenticatedUser user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedAuthState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedAuthStateCopyWith<_$_AuthenticatedAuthState> get copyWith =>
      __$$_AuthenticatedAuthStateCopyWithImpl<_$_AuthenticatedAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedAuthState extends AuthState {
  const factory _AuthenticatedAuthState(
      {required final AuthenticatedUser user}) = _$_AuthenticatedAuthState;
  const _AuthenticatedAuthState._() : super._();

  @override
  AuthenticatedUser get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedAuthStateCopyWith<_$_AuthenticatedAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InProcessAuthStateCopyWith<$Res> {
  factory _$$_InProcessAuthStateCopyWith(_$_InProcessAuthState value,
          $Res Function(_$_InProcessAuthState) then) =
      __$$_InProcessAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_InProcessAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_InProcessAuthState>
    implements _$$_InProcessAuthStateCopyWith<$Res> {
  __$$_InProcessAuthStateCopyWithImpl(
      _$_InProcessAuthState _value, $Res Function(_$_InProcessAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_InProcessAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_InProcessAuthState extends _InProcessAuthState {
  const _$_InProcessAuthState({this.user = const UserEntity.notAuthenticated()})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;

  @override
  String toString() {
    return 'AuthState.inProcess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InProcessAuthState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InProcessAuthStateCopyWith<_$_InProcessAuthState> get copyWith =>
      __$$_InProcessAuthStateCopyWithImpl<_$_InProcessAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) {
    return inProcess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) {
    return inProcess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) {
    return inProcess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) {
    return inProcess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess(this);
    }
    return orElse();
  }
}

abstract class _InProcessAuthState extends AuthState {
  const factory _InProcessAuthState({final UserEntity user}) =
      _$_InProcessAuthState;
  const _InProcessAuthState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_InProcessAuthStateCopyWith<_$_InProcessAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotAuthenticatedAuthStateCopyWith<$Res> {
  factory _$$_NotAuthenticatedAuthStateCopyWith(
          _$_NotAuthenticatedAuthState value,
          $Res Function(_$_NotAuthenticatedAuthState) then) =
      __$$_NotAuthenticatedAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_NotAuthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_NotAuthenticatedAuthState>
    implements _$$_NotAuthenticatedAuthStateCopyWith<$Res> {
  __$$_NotAuthenticatedAuthStateCopyWithImpl(
      _$_NotAuthenticatedAuthState _value,
      $Res Function(_$_NotAuthenticatedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_NotAuthenticatedAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_NotAuthenticatedAuthState extends _NotAuthenticatedAuthState {
  const _$_NotAuthenticatedAuthState(
      {this.user = const UserEntity.notAuthenticated()})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;

  @override
  String toString() {
    return 'AuthState.notAuthenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotAuthenticatedAuthState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotAuthenticatedAuthStateCopyWith<_$_NotAuthenticatedAuthState>
      get copyWith => __$$_NotAuthenticatedAuthStateCopyWithImpl<
          _$_NotAuthenticatedAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) {
    return notAuthenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) {
    return notAuthenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _NotAuthenticatedAuthState extends AuthState {
  const factory _NotAuthenticatedAuthState({final UserEntity user}) =
      _$_NotAuthenticatedAuthState;
  const _NotAuthenticatedAuthState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_NotAuthenticatedAuthStateCopyWith<_$_NotAuthenticatedAuthState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorAuthStateCopyWith<$Res> {
  factory _$$_ErrorAuthStateCopyWith(
          _$_ErrorAuthState value, $Res Function(_$_ErrorAuthState) then) =
      __$$_ErrorAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user, String message});
}

/// @nodoc
class __$$_ErrorAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_ErrorAuthState>
    implements _$$_ErrorAuthStateCopyWith<$Res> {
  __$$_ErrorAuthStateCopyWithImpl(
      _$_ErrorAuthState _value, $Res Function(_$_ErrorAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_$_ErrorAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorAuthState extends _ErrorAuthState {
  const _$_ErrorAuthState(
      {this.user = const UserEntity.notAuthenticated(),
      this.message = 'Произошла ошибка'})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthState.error(user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorAuthState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorAuthStateCopyWith<_$_ErrorAuthState> get copyWith =>
      __$$_ErrorAuthStateCopyWithImpl<_$_ErrorAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) {
    return error(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) {
    return error?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAuthState extends AuthState {
  const factory _ErrorAuthState({final UserEntity user, final String message}) =
      _$_ErrorAuthState;
  const _ErrorAuthState._() : super._();

  @override
  UserEntity get user;
  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorAuthStateCopyWith<_$_ErrorAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessfulAuthStateCopyWith<$Res> {
  factory _$$_SuccessfulAuthStateCopyWith(_$_SuccessfulAuthState value,
          $Res Function(_$_SuccessfulAuthState) then) =
      __$$_SuccessfulAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_SuccessfulAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_SuccessfulAuthState>
    implements _$$_SuccessfulAuthStateCopyWith<$Res> {
  __$$_SuccessfulAuthStateCopyWithImpl(_$_SuccessfulAuthState _value,
      $Res Function(_$_SuccessfulAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_SuccessfulAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_SuccessfulAuthState extends _SuccessfulAuthState {
  const _$_SuccessfulAuthState(
      {this.user = const UserEntity.notAuthenticated()})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;

  @override
  String toString() {
    return 'AuthState.successful(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessfulAuthState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessfulAuthStateCopyWith<_$_SuccessfulAuthState> get copyWith =>
      __$$_SuccessfulAuthStateCopyWithImpl<_$_SuccessfulAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticatedUser user) authenticated,
    required TResult Function(UserEntity user) inProcess,
    required TResult Function(UserEntity user) notAuthenticated,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) successful,
  }) {
    return successful(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticatedUser user)? authenticated,
    TResult? Function(UserEntity user)? inProcess,
    TResult? Function(UserEntity user)? notAuthenticated,
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? successful,
  }) {
    return successful?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticatedUser user)? authenticated,
    TResult Function(UserEntity user)? inProcess,
    TResult Function(UserEntity user)? notAuthenticated,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_InProcessAuthState value) inProcess,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
    required TResult Function(_ErrorAuthState value) error,
    required TResult Function(_SuccessfulAuthState value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_InProcessAuthState value)? inProcess,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult? Function(_ErrorAuthState value)? error,
    TResult? Function(_SuccessfulAuthState value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_InProcessAuthState value)? inProcess,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    TResult Function(_ErrorAuthState value)? error,
    TResult Function(_SuccessfulAuthState value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _SuccessfulAuthState extends AuthState {
  const factory _SuccessfulAuthState({final UserEntity user}) =
      _$_SuccessfulAuthState;
  const _SuccessfulAuthState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_SuccessfulAuthStateCopyWith<_$_SuccessfulAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
