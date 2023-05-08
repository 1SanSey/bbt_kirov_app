import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final BookHiveDataSource hiveDataSource;
  final BookRemoteDataSource bookRemoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      {required this.bookRemoteDataSource,
      required this.networkInfo,
      required this.hiveDataSource});

  @override
  String addToCart(CartBookEntity book) {
    final hiveBook = CartBookModel(
        name: book.name,
        price: book.price,
        quantity: book.quantity,
        image: book.image);
    return hiveDataSource.addToCart(hiveBook);
  }

  @override
  void removeFromCart(int index) {
    hiveDataSource.removeFromCart(index);
  }

  @override
  List<CartBookEntity> showCart() {
    return hiveDataSource.showCart();
  }

  @override
  void changeQuantityCart(int index, int value) {
    hiveDataSource.changeQuantityCart(index, value);
  }

  @override
  void sendOrder(OrderEntity order) {
    bookRemoteDataSource.sendOrder(order);
  }

  @override
  int totalSum() {
    return hiveDataSource.totalSum();
  }

  @override
  void removeAllCart() {
    return hiveDataSource.removeAllCart();
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
