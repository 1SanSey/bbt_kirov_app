import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/domain/repositories/favourites_repository.dart';

class FavouritesUseCase {
  final FavouritesRepository favouritesRepository;

  FavouritesUseCase(this.favouritesRepository);

  String addToFavourites(FavouritesBookModel book) {
    return favouritesRepository.addToFavourites(book);
  }

  void removeFromFavourites(FavouritesBookModel book, int index) {
    favouritesRepository.removeFromFavourites(book, index);
  }

  List<FavouritesBookModel> showFavourites() {
    return favouritesRepository.showFavourites();
  }
}
