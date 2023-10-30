import 'package:bbt_kirov_app/features/favorites/domain/entities/favorites_book_entity.dart';

abstract class FavouritesRepository {
  String addToFavourites(FavoritesBookEntity book);
  void removeFromFavourites(FavoritesBookEntity book, int index);
  List<FavoritesBookEntity> showFavourites();
}
