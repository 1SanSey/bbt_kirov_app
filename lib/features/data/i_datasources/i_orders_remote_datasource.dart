import 'package:bbt_kirov_app/features/data/models/order_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';

abstract class IOrdersRemoteDatasource {
  void sendOrder(OrderEntity order);
  Future<List<OrderModel>> fetchOrders(String username);
}
