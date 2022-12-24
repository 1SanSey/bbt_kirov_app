import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/models/book_model.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final BookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  void addToCart(BookEntity book) {
    remoteDataSource.addToCart(book as BookModel);
  }

  @override
  void removeFromCart(BookEntity book) {
    remoteDataSource.addToCart(book as BookModel);
  }

  @override
  List<BookEntity> showCart() {
    return remoteDataSource.showCart();
  }

  /* Future<Either<Failure, List<BookModel>>> _getBooks(
      Future<List<BookModel>> Function() getBooks) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBooks = await getBooks();

        return Right(remoteBooks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  } */
}
