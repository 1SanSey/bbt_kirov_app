import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/domain/repositories/favourites_repository.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  final BookHiveDataSource hiveDataSource;
  final NetworkInfo networkInfo;

  FavouritesRepositoryImpl(
      {required this.networkInfo, required this.hiveDataSource});

  @override
  void addToFavourites(FavouritesBookModel book) {
    hiveDataSource.addToFavourites(book);
  }

  @override
  void removeFromFavourites(FavouritesBookModel book, int index) {
    hiveDataSource.removeFromFavourites(book, index);
  }

  @override
  List<FavouritesBookModel> showFavourites() {
    return hiveDataSource.showFavourites();
  }
}
