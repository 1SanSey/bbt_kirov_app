import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AuthenticatedUser>> login(
      {required final String login, required final String password});
  Future<Either<Failure, String>> register(
      {required final String login, required final String password, required final String email});
  Future<Either<Failure, NotAuthenticatedUser>> logout();
}
