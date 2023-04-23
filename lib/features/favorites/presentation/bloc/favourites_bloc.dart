import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/domain/usecases/favourites_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesUseCase favourites;

  FavouritesBloc({required this.favourites}) : super(EmptyFavouritesState()) {
    on<AddToFavouritesEvent>(_addToFavourites);
    on<RemoveFromFavouritesEvent>(_removeFromFavourites);
    on<ShowFavouritesEvent>(_showFavourites);
  }

  void _addToFavourites(
      AddToFavouritesEvent event, Emitter<FavouritesState> emit) {
    String message = favourites.addToFavourites(event.book);

    emit(AddToFavouritesState(book: event.book, message: message));
  }

  void _removeFromFavourites(
      RemoveFromFavouritesEvent event, Emitter<FavouritesState> emit) {
    favourites.removeFromFavourites(event.book, event.index);
  }

  void _showFavourites(
      ShowFavouritesEvent event, Emitter<FavouritesState> emit) {
    favourites.showFavourites();

    emit(ShowFavouritesState(books: favourites.showFavourites()));
  }
}
