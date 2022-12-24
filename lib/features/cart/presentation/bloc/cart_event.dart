part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class EmptyCartEvent extends CartEvent {}

class ShowCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final BookEntity param;

  const AddToCartEvent({required this.param});
}

class RemoveFromCartEvent extends CartEvent {
  final BookEntity param;

  const RemoveFromCartEvent({required this.param});
}
