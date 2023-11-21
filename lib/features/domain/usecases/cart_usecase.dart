import 'package:bbt_kirov_app/features/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_cart_repository.dart';

class CartUsecase {
  final ICartRepository cartRepository;

  CartUsecase(this.cartRepository);

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
