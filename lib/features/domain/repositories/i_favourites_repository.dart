import 'package:bbt_kirov_app/features/domain/entities/favorites_book_entity.dart';

abstract class IFavouritesRepository {
  String addToFavourites(FavoritesBookEntity book);
  void removeFromFavourites(FavoritesBookEntity book, int index);
  List<FavoritesBookEntity> showFavourites();
}
