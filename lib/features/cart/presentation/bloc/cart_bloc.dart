import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/usecases/cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUseCase cart;

  CartBloc({required this.cart}) : super(EmptyCartState()) {
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
    on<ShowCartEvent>(_showCart);
    on<ChangeQuantityCartEvent>(_changeQuantityCart);
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    cart.addToCart(event.book);
  }

  void _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cart.removeFromCart(event.book, event.index);
  }

  void _showCart(ShowCartEvent event, Emitter<CartState> emit) {
    cart.showCart();

    emit(ShowCartState(books: cart.showCart()));
  }

  void _changeQuantityCart(
      ChangeQuantityCartEvent event, Emitter<CartState> emit) {
    cart.changeQuantityCart(event.index, event.value);
  }
}
