import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartUseCase {
  final CartRepository cartRepository;

  CartUseCase(this.cartRepository);

  void addToCart(BookEntity book) {
    cartRepository.addToCart(book);
  }

  void removeFromCart(BookEntity book) {
    cartRepository.removeFromCart(book);
  }

  List<BookEntity> showCart() {
    return cartRepository.showCart();
  }
}
