import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/get_books_category.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/home/data/repositories/book_repository_impl.dart';
import 'package:bbt_kirov_app/features/home/domain/repositories/book_repository.dart';
import 'package:bbt_kirov_app/features/category/data/repositories/book_repository_impl.dart';
import 'package:bbt_kirov_app/features/category/domain/repositories/book_repository.dart';
import 'package:bbt_kirov_app/features/home/domain/usecases/get_books_home.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

init() async {
//BLoC & Cubit

  sl.registerFactory(() => HomeBooksBloc(popularBooks: sl()));
  sl.registerFactory(() => CategoryAllBooksBloc(allBooks: sl()));
  sl.registerFactory(() => CategoryBooksBySizeBloc(booksBySize: sl()));
  sl.registerFactory(() => CategoryBooksByNameBloc(booksByName: sl()));
  sl.registerFactory(() => CategoryBooksSetBloc(setBooks: sl()));
  sl.registerFactory(() => CategoryCulinaryBooksBloc(culinaryBooks: sl()));

//UseCases
  sl.registerLazySingleton(() => PopularBooks(sl()));
  sl.registerLazySingleton(() => AllBooks(sl()));
  sl.registerLazySingleton(() => BooksBySize(sl()));
  sl.registerLazySingleton(() => BooksByName(sl()));
  sl.registerLazySingleton(() => SetBooks(sl()));
  sl.registerLazySingleton(() => CulinaryBooks(sl()));

//Repository
  sl.registerLazySingleton<BookHomeRepository>(
      () => BookHomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<BookCategoryRepository>(() =>
      BookCategoryRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl());

//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
