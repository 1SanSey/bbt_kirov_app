import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_user_remote_datasorce.dart';
import 'package:bbt_kirov_app/features/domain/entities/user_entity/user_entity.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IUserRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String login,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authenticatedUser = await remoteDataSource.userLogin(login, password);

        return Right(authenticatedUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String login,
    required String password,
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final registeredUser = await remoteDataSource.userRegister(login, password, email);

        return Right(registeredUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        final notAuthenticatedUser = await remoteDataSource.userLogout();

        return Right(notAuthenticatedUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
