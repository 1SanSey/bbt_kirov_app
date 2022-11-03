part of 'category_bloc.dart';

abstract class CategoryBooksState extends Equatable {
  const CategoryBooksState();

  @override
  List<Object?> get props => [];
}

class CategoryBooksEmpty extends CategoryBooksState {}

class CategoryBooksLoading extends CategoryBooksState {}

class CategoryBooksLoaded extends CategoryBooksState {
  final List<BookEntity> books;

  const CategoryBooksLoaded({required this.books});

  @override
  List<Object?> get props => [books];
}

class CategoryBooksError extends CategoryBooksState {
  final String message;

  const CategoryBooksError({required this.message});

  @override
  List<Object?> get props => [message];
}
