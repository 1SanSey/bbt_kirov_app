import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/themes/themes.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/features/authentication/data/logged_in_model.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/authentication/presentation/auth_bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookRemoteDataSourceImpl.initParse();
  await BookHiveDataSourceImpl.initHive();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LoggedInUserModel loggedIn = LoggedInUserModel();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBLoC>(create: (context) => di.sl<AuthBLoC>()),
        BlocProvider<HomeBooksBloc>(
            create: (context) => di.sl<HomeBooksBloc>()),
        BlocProvider<CategoryBooksBloc>(
            create: (context) => di.sl<CategoryBooksBloc>()),
        BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
        BlocProvider<FavouritesBloc>(
            create: (context) => di.sl<FavouritesBloc>()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: 'BBT Kirov App',
            theme: themeNotifier.isDark ? darkTheme() : lightTheme(),
            debugShowCheckedModeBanner: false,
            home: loggedIn.isLoggedIn ? const HomePage() : const AuthPage(),
          );
        }),
      ),
    );
  }
}
