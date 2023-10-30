import 'package:bbt_kirov_app/features/cart/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';

abstract class CartRepository {
  String addToCart(CartBookEntity book);
  void removeFromCart(int index);
  void changeQuantityCart(int index, int value);
  List<CartBookEntity> showCart();
  int totalSum();
  void sendOrder(OrderEntity order);
  void removeAllCart();
}
