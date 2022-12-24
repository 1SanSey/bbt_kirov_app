import 'package:bbt_kirov_app/core/entities/book_entity.dart';

abstract class CartRepository {
  void addToCart(BookEntity book);
  void removeFromCart(BookEntity book);
  List<BookEntity> showCart();
}
