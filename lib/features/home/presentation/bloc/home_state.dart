part of 'home_bloc.dart';

abstract class HomeBooksState extends Equatable {
  const HomeBooksState();

  @override
  List<Object?> get props => [];
}

class HomeBooksEmpty extends HomeBooksState {}

class HomeBooksLoading extends HomeBooksState {}

class HomeBooksLoaded extends HomeBooksState {
  final List<BookEntity> books;

  const HomeBooksLoaded({required this.books});

  @override
  List<Object?> get props => [books];
}

class HomeBooksError extends HomeBooksState {
  final String message;

  const HomeBooksError({required this.message});

  @override
  List<Object?> get props => [message];
}
