import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/home/data/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/home/data/models/book_model.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/home/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> getAllBooks() async {
    return _getBooks(() {
      return remoteDataSource.getBooksByPopularity();
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
