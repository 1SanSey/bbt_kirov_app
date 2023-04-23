import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';

abstract class FavouritesRepository {
  String addToFavourites(FavouritesBookModel book);
  void removeFromFavourites(FavouritesBookModel book, int index);
  List<FavouritesBookModel> showFavourites();
}
