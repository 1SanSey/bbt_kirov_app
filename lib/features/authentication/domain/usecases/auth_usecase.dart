import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/core/usecases/usecases.dart';
import 'package:bbt_kirov_app/features/authentication/domain/entities/user_entity.dart';
import 'package:bbt_kirov_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthUseCase extends UseCaseByParams<AuthenticatedUser, UserParams> {
  final IAuthRepository authRepository;

  AuthUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(UserParams params) async {
    return await authRepository.login(
        login: params.login, password: params.password);
  }
}

class UserParams extends Equatable {
  final String login;
  final String password;

  const UserParams({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}
