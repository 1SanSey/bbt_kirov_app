import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.logIn({
    required String login,
    required String password,
  }) = _LogInAuthEvent;
  const factory AuthEvent.logOut() = _LogOutAuthEvent;
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  bool get isAuthenticated => user.isAuthenticated;

  AuthenticatedUser? get authenticatedOrNull => maybeMap<AuthenticatedUser?>(
        orElse: () => user.authenticatedOrNull,
        notAuthenticated: (_) => null,
      );

  bool get inProgress => maybeMap<bool>(
        orElse: () => true,
        notAuthenticated: (_) => false,
        authenticated: (_) => false,
      );

  @override
  UserEntity get user => when<UserEntity>(
        authenticated: (user) => user,
        inProcess: (user) => user,
        notAuthenticated: (user) => user,
        successful: (user) => user,
        error: (user, _) => user,
      );

  const factory AuthState.authenticated({
    required final AuthenticatedUser user,
  }) = _AuthenticatedAuthState;

  const factory AuthState.inProcess({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _InProcessAuthState;

  const factory AuthState.notAuthenticated({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _NotAuthenticatedAuthState;

  const factory AuthState.error({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
    @Default('Произошла ошибка') String message,
  }) = _ErrorAuthState;

  const factory AuthState.successful({
    @Default(UserEntity.notAuthenticated()) final UserEntity user,
  }) = _SuccessfulAuthState;
}

class AuthBLoC extends Bloc<AuthEvent, AuthState> {
  AuthBLoC({
    required final IAuthRepository repository,
    final UserEntity? userEntity,
  })  : _repository = repository,
        super(
          userEntity?.when<AuthState>(
                authenticated: (user) => AuthState.authenticated(user: user),
                notAuthenticated: () => const AuthState.notAuthenticated(),
              ) ??
              const AuthState.notAuthenticated(),
        ) {
    on<AuthEvent>(
      (event, emitter) => event.map<Future<void>>(
        logIn: (event) => _logIn(event, emitter),
        logOut: (event) => _logOut(event, emitter),
      ),
      transformer: bloc_concurrency.droppable(),
    );
  }
  final IAuthRepository _repository;

  Future<void> _logIn(_LogInAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      emitter(AuthState.inProcess(user: state.user));
      final newUser =
          await _repository.login(login: event.login, password: event.password);

      newUser.fold(
          (failure) =>
              emitter(AuthState.error(message: mapFailureToMessage(failure))),
          (user) {
        emitter(AuthState.successful(user: user));
      });
    } on FormatException {
      emitter(AuthState.error(
          user: state.user, message: 'Нельзя залогиниться - нет интернета'));
    } on Object {
      emitter(
          AuthState.error(user: state.user, message: 'Ошибка аутентификации'));
      // без rethrow будет замалчивание ошибок
      rethrow;
    } finally {
      emitter(
        state.user.when<AuthState>(
          authenticated: (user) => AuthState.authenticated(user: user),
          notAuthenticated: () => const AuthState.notAuthenticated(),
        ),
      );
    }
  }

  Future<void> _logOut(
      _LogOutAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      emitter(AuthState.inProcess(user: state.user));
      final notAuthenticatedUser = await _repository.logout();
      notAuthenticatedUser.fold(
          (failure) =>
              emitter(AuthState.error(message: mapFailureToMessage(failure))),
          (notAuthenticatedUser) {
        emitter(AuthState.successful(user: notAuthenticatedUser));
      });
    } on FormatException {
      emitter(AuthState.error(
          user: state.user, message: 'Нельзя залогиниться - нет интернета'));
    } on Object {
      emitter(
          AuthState.error(user: state.user, message: 'Ошибка аутентификации'));
      rethrow;
    } finally {
      emitter(
        state.user.when<AuthState>(
          authenticated: (user) => AuthState.authenticated(user: user),
          notAuthenticated: () => const AuthState.notAuthenticated(),
        ),
      );
    }
  }
}
