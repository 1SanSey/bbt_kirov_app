import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';

abstract class CartRepository {
  void addToCart(CartBookModel book);
  void removeFromCart(CartBookModel book, int index);
  List<CartBookModel> showCart();
}
