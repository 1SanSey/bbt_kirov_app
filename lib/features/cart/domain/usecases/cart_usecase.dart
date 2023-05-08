import 'package:bbt_kirov_app/features/cart/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartUseCase {
  final CartRepository cartRepository;

  CartUseCase(this.cartRepository);

  String addToCart(CartBookEntity book) {
    return cartRepository.addToCart(book);
  }

  void removeFromCart(int index) {
    cartRepository.removeFromCart(index);
  }

  void changeQuantityCart(int index, int value) {
    cartRepository.changeQuantityCart(index, value);
  }

  List<CartBookEntity> showCart() {
    return cartRepository.showCart();
  }

  int totalSum() {
    return cartRepository.totalSum();
  }

  void sendOrder(OrderEntity order) {
    cartRepository.sendOrder(order);
  }

  void removeAllCart() {
    cartRepository.removeAllCart();
  }
}
