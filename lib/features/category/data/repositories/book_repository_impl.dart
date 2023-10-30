import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/category/domain/repositories/book_repository.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/models/book_model.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class BookCategoryRepositoryImpl implements BookCategoryRepository {
  final BookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookCategoryRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> getAllBooks() {
    return _getBooks(() {
      return remoteDataSource.getAllBooks();
    });
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getCulinaryBooks() {
    return _getBooks(() {
      return remoteDataSource.getCulinaryBooks();
    });
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getBooksByName(String name) {
    return _getBooks(() {
      return remoteDataSource.getBooksByName(name);
    });
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getBooksBySize(String size) {
    return _getBooks(() {
      return remoteDataSource.getBooksBySize(size);
    });
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getSetBooks(String singleOrSet) {
    return _getBooks(() {
      return remoteDataSource.getSetBooks(singleOrSet);
    });
  }

  Future<Either<Failure, List<BookModel>>> _getBooks(
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
  }
}
