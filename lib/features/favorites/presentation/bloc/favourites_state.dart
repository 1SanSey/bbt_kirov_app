part of 'favourites_bloc.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object?> get props => [];
}

class EmptyFavouritesState extends FavouritesState {}

class AddToFavouritesState extends FavouritesState {
  final FavouritesBookModel book;

  const AddToFavouritesState({required this.book});

  @override
  List<Object?> get props => [book];
}

class RemoveFromFavouritesState extends FavouritesState {
  final FavouritesBookModel book;

  const RemoveFromFavouritesState({required this.book});

  @override
  List<Object?> get props => [book];
}

class ShowFavouritesState extends FavouritesState {
  final List<FavouritesBookModel> books;

  const ShowFavouritesState({required this.books});

  @override
  List<Object?> get props => [books];
}
