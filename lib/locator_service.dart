import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/core/widgets/navbar/navbar_bloc/navbar_bloc.dart';
import 'package:bbt_kirov_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:bbt_kirov_app/features/cart/domain/usecases/cart_usecase.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/get_books_category.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/search_books_category.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/home/data/repositories/book_repository_impl.dart';
import 'package:bbt_kirov_app/features/home/domain/repositories/book_repository.dart';
import 'package:bbt_kirov_app/features/category/data/repositories/book_repository_impl.dart';
import 'package:bbt_kirov_app/features/category/domain/repositories/book_repository.dart';
import 'package:bbt_kirov_app/features/home/domain/usecases/get_books_home.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

init() async {
//BLoC & Cubit

  sl.registerFactory(() => HomeBooksBloc(popularBooks: sl()));
  sl.registerFactory(() => CategoryBooksBloc(
        allBooks: sl(),
        booksBySize: sl(),
        booksByName: sl(),
        setBooks: sl(),
        culinaryBooks: sl(),
        searchBooks: sl(),
      ));
  sl.registerFactory(() => CartBloc(cart: sl()));
  sl.registerFactory<NavbarBloc>(() => NavbarBloc());

//UseCases
  sl.registerLazySingleton(() => PopularBooks(sl()));
  sl.registerLazySingleton(() => AllBooks(sl()));
  sl.registerLazySingleton(() => BooksBySize(sl()));
  sl.registerLazySingleton(() => BooksByName(sl()));
  sl.registerLazySingleton(() => SetBooks(sl()));
  sl.registerLazySingleton(() => CulinaryBooks(sl()));
  sl.registerLazySingleton(() => SearchBooksCategory(sl()));
  sl.registerLazySingleton(() => CartUseCase(sl()));

//Repository
  sl.registerLazySingleton<BookHomeRepository>(
      () => BookHomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<BookCategoryRepository>(() =>
      BookCategoryRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl());

//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
