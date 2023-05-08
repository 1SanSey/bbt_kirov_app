import 'package:bbt_kirov_app/features/favorites/domain/entities/favorites_book_entity.dart';
import 'package:bbt_kirov_app/features/favorites/domain/repositories/favourites_repository.dart';

class FavouritesUseCase {
  final FavouritesRepository favouritesRepository;

  FavouritesUseCase(this.favouritesRepository);

  String addToFavourites(FavoritesBookEntity book) {
    return favouritesRepository.addToFavourites(book);
  }

  void removeFromFavourites(FavoritesBookEntity book, int index) {
    favouritesRepository.removeFromFavourites(book, index);
  }

  List<FavoritesBookEntity> showFavourites() {
    return favouritesRepository.showFavourites();
  }
}
