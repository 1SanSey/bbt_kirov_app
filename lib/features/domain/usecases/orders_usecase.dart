import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_orders_repository.dart';
import 'package:bbt_kirov_app/features/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class OrdersUsecase extends UseCaseByParams<List<OrderEntity>, OrdersParams> {
  final IOrdersRepository ordersRepository;

  OrdersUsecase(this.ordersRepository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(OrdersParams params) async {
    return await ordersRepository.fetchOrders(params.username);
  }
}

class OrdersParams extends Equatable {
  final String username;

  const OrdersParams({required this.username});

  @override
  List<Object?> get props => [username];
}
