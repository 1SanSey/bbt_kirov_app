import 'package:bbt_kirov_app/features/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';

abstract class ICartRepository {
  String addToCart(CartBookEntity book);
  void removeFromCart(int index);
  void changeQuantityCart(int index, int value);
  List<CartBookEntity> showCart();
  int totalSum();
  void sendOrder(OrderEntity order);
  void removeAllCart();
}
