import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required username,
    required dateOrder,
    required sumOrder,
    required books,
  }) : super(
          username: username,
          dateOrder: dateOrder,
          sumOrder: sumOrder,
          books: books,
        );

  factory OrderModel.fromDb(ParseObject object) {
    return OrderModel(
      username: object.get<String>('username'),
      dateOrder: object.get<DateTime>('dateOrder'),
      sumOrder: object.get<int>('sumOrder'),
      books: object.get<Map<String, dynamic>>('books'),
    );
  }
}
