part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class EmptyCartState extends CartState {}

class AddToCartState extends CartState {
  final CartBookModel book;

  const AddToCartState({required this.book});

  @override
  List<Object?> get props => [book];
}

class RemoveFromCartState extends CartState {
  final CartBookModel book;

  const RemoveFromCartState({required this.book});

  @override
  List<Object?> get props => [book];
}

class ShowCartState extends CartState {
  final List<CartBookModel> books;

  const ShowCartState({required this.books});

  @override
  List<Object?> get props => [books];
}

class ChangeQuantityCartState extends CartState {
  final int index;
  final int value;

  const ChangeQuantityCartState({required this.index, required this.value});

  @override
  List<Object?> get props => [index, value];
}
