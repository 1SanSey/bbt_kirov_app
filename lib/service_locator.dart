import 'package:bbt_kirov_app/core/platform/network_info.dart';
import 'package:bbt_kirov_app/features/data/datasouces/books_local_datasource_impl.dart';
import 'package:bbt_kirov_app/features/data/datasouces/books_remote_datasource_impl.dart';
import 'package:bbt_kirov_app/features/data/datasouces/orders_remote_datasource_impl.dart';
import 'package:bbt_kirov_app/features/data/datasouces/user_remote_datasource_impl.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_books_local_datasource.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_books_remote_datasource.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_orders_remote_datasource.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_user_remote_datasorce.dart';
import 'package:bbt_kirov_app/features/data/repositories/auth_repository_impl.dart';
import 'package:bbt_kirov_app/features/data/repositories/books_home_repository_impl.dart';
import 'package:bbt_kirov_app/features/data/repositories/cart_repository_impl.dart';
import 'package:bbt_kirov_app/features/data/repositories/categories_repository_impl.dart';
import 'package:bbt_kirov_app/features/data/repositories/favourites_repository_impl.dart';
import 'package:bbt_kirov_app/features/data/repositories/orders_repository_impl.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_auth_repository.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_books_home_repository.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_cart_repository.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_categories_repository.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_favourites_repository.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_orders_repository.dart';
import 'package:bbt_kirov_app/features/domain/usecases/cart_usecase.dart';
import 'package:bbt_kirov_app/features/domain/usecases/categories/categories_usecases.dart';
import 'package:bbt_kirov_app/features/domain/usecases/categories/search_books_usecases.dart';
import 'package:bbt_kirov_app/features/domain/usecases/favourites_usecase.dart';
import 'package:bbt_kirov_app/features/domain/usecases/orders_usecase.dart';
import 'package:bbt_kirov_app/features/domain/usecases/popular_usecase.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/change_theme_bloc/change_theme_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/home_books_bloc/home_books_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/reg_bloc/registration_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

init() async {
//BLoC & Cubit
  sl.registerFactory(() => HomeBooksBloc(popularBooks: sl()));
  sl.registerFactory(() => CategoryBloc(
        allBooks: sl(),
        booksBySize: sl(),
        booksByName: sl(),
        setBooks: sl(),
        culinaryBooks: sl(),
        searchBooks: sl(),
      ));
  sl.registerFactory(() => CartBloc(cart: sl()));
  sl.registerFactory(() => FavouritesBloc(favourites: sl()));
  sl.registerFactory(() => AuthBloc(repository: sl()));
  sl.registerFactory(() => RegistrationBloc(sl()));
  sl.registerFactory(() => ChangeThemeBloc());
  sl.registerFactory(() => OrdersBloc(ordersUseCase: sl()));

//UseCases
  sl.registerLazySingleton(() => PopularUsecase(sl()));
  sl.registerLazySingleton(() => AllBooksUsecase(sl()));
  sl.registerLazySingleton(() => BooksBySizeUsecase(sl()));
  sl.registerLazySingleton(() => BooksByNameUsecase(sl()));
  sl.registerLazySingleton(() => SetBooksUsecase(sl()));
  sl.registerLazySingleton(() => CulinaryBooksUsecase(sl()));
  sl.registerLazySingleton(() => SearchBooksUsecase(sl()));
  sl.registerLazySingleton(() => CartUsecase(sl()));
  sl.registerLazySingleton(() => FavouritesUsecase(sl()));
  sl.registerLazySingleton(() => OrdersUsecase(sl()));

//Repositories
  sl.registerLazySingleton<IBooksHomeRepository>(
      () => BooksHomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ICategoriesRepository>(
      () => CategoriesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ICartRepository>(() =>
      CartRepositoryImpl(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<IFavouritesRepository>(
      () => FavouritesRepositoryImpl(hiveDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<IOrdersRepository>(
      () => OrdersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

//Datasources
  sl.registerLazySingleton<IUserRemoteDatasource>(() => UserRemoteDatasourceImpl());
  sl.registerLazySingleton<IBooksRemoteDatasource>(() => BooksRemoteDatasourceImpl());
  sl.registerLazySingleton<IOrdersRemoteDatasource>(() => OrdersRemoteDatasourceImpl());
  sl.registerLazySingleton<IBooksLocalDatasource>(() => BooksLocalDatasourceImpl());

//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
