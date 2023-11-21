import 'package:bbt_kirov_app/features/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/domain/usecases/cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase cart;

  CartBloc({required this.cart}) : super(EmptyCartState()) {
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
    on<ShowCartEvent>(_showCart);
    on<ChangeQuantityCartEvent>(_changeQuantityCart);
    on<SendOrderEvent>(_sendOrder);
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    String message = cart.addToCart(event.book);
    emit(AddToCartState(book: event.book, message: message));
    emit(EmptyCartState());
  }

  void _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cart.removeFromCart(event.index);
  }

  void _showCart(ShowCartEvent event, Emitter<CartState> emit) {
    List<CartBookEntity> books = cart.showCart();
    int totalSum = cart.totalSum();

    emit(ShowCartState(books: books, totalSum: totalSum));
  }

  void _changeQuantityCart(ChangeQuantityCartEvent event, Emitter<CartState> emit) {
    cart.changeQuantityCart(event.index, event.value);
  }

  void _sendOrder(SendOrderEvent event, Emitter<CartState> emit) {
    cart.sendOrder(event.order);
    cart.removeAllCart();
  }
}
