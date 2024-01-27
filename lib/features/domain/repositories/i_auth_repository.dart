import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/domain/entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String login,
    required String password,
  });
  Future<Either<Failure, String>> register({
    required String login,
    required String password,
    required String email,
  });
  Future<Either<Failure, UserEntity>> logout();
}
