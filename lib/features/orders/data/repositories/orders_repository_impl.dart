import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/orders/data/models/order_model.dart';
import 'package:bbt_kirov_app/features/orders/domain/repositories/i_orders_repository.dart';
import 'package:dartz/dartz.dart';

class OrdersRepositoryImpl implements IOrdersRepository {
  final BookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OrdersRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders(String username) {
    return _fetchOrders(() {
      return remoteDataSource.fetchOrders(username);
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
}
