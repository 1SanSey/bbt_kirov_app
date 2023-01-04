import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({dateOrder, sumOrder, books})
      : super(dateOrder: dateOrder, sumOrder: sumOrder, books: books);
}
