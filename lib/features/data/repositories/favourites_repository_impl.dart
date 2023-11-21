import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_books_local_datasource.dart';
import 'package:bbt_kirov_app/features/data/models/favourites_book_model/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/favorites_book_entity.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_favourites_repository.dart';

class FavouritesRepositoryImpl implements IFavouritesRepository {
  final IBooksLocalDatasource hiveDataSource;
  final NetworkInfo networkInfo;

  FavouritesRepositoryImpl(
      {required this.networkInfo, required this.hiveDataSource});

  @override
  String addToFavourites(FavoritesBookEntity book) {
    final hiveBook = FavouritesBookModel(
        name: book.name, price: book.price, image: book.image);
    return hiveDataSource.addToFavourites(hiveBook);
  }

  @override
  void removeFromFavourites(FavoritesBookEntity book, int index) {
    final hiveBook = FavouritesBookModel(
        name: book.name, price: book.price, image: book.image);
    hiveDataSource.removeFromFavourites(hiveBook, index);
  }

  @override
  List<FavoritesBookEntity> showFavourites() {
    return hiveDataSource.showFavourites();
  }
}
