import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final BookHiveDataSource hiveDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({required this.networkInfo, required this.hiveDataSource});

  @override
  void addToCart(CartBookModel book) {
    hiveDataSource.addToCart(book);
  }

  @override
  void removeFromCart(CartBookModel book, int index) {
    hiveDataSource.removeFromCart(book, index);
  }

  @override
  List<CartBookModel> showCart() {
    return hiveDataSource.showCart();
  }

  @override
  void changeQuantityCart(int index, int value) {
    hiveDataSource.changeQuantityCart(index, value);
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
