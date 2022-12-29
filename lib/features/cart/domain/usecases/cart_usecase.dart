import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartUseCase {
  final CartRepository cartRepository;

  CartUseCase(this.cartRepository);

  void addToCart(CartBookModel book) {
    cartRepository.addToCart(book);
  }

  void removeFromCart(CartBookModel book, int index) {
    cartRepository.removeFromCart(book, index);
  }

  void changeQuantityCart(int index, int value) {
    cartRepository.changeQuantityCart(index, value);
  }

  List<CartBookModel> showCart() {
    return cartRepository.showCart();
  }
}
