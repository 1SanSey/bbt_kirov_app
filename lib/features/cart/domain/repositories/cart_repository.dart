import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';

abstract class CartRepository {
  String addToCart(CartBookModel book);
  void removeFromCart(int index);
  void changeQuantityCart(int index, int value);
  List<CartBookModel> showCart();
  int totalSum();
  void sendOrder(OrderEntity order);
  void removeAllCart();
}
