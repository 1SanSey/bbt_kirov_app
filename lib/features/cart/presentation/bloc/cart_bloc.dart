import 'package:bbt_kirov_app/core/entities/book_entity.dart';
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
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    cart.addToCart(event.param);
    //cart.showCart();

    // emit(ShowCartState(books: cart.showCart()));
  }

  void _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cart.removeFromCart(event.param);
    //cart.showCart();

    //emit(ShowCartState(books: cart.showCart()));
  }

  void _showCart(ShowCartEvent event, Emitter<CartState> emit) {
    cart.showCart();

    emit(ShowCartState(books: cart.showCart()));
  }
}