import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_orders_remote_datasource.dart';
import 'package:bbt_kirov_app/features/data/models/order_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_orders_repository.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class OrdersRepositoryImpl implements IOrdersRepository {
  final IOrdersRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  OrdersRepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders(String userId) {
    return _fetchOrders(() {
      return remoteDataSource.fetchOrders(userId);
    });
  }

  Future<Either<Failure, List<OrderModel>>> _fetchOrders(
      Future<List<OrderModel>> Function() fetchOrders) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteOrders = await fetchOrders();

        return Right(remoteOrders);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> sendOrder(OrderEntity order) async {
    if (await networkInfo.isConnected) {
      try {
        final success = await remoteDataSource.sendOrder(order);

        return Right(success);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
