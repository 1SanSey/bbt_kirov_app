import 'dart:developer';

import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/core/themes/change_theme_bloc.dart';
import 'package:bbt_kirov_app/core/themes/themes.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/reg_bloc/registration_bloc.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:bbt_kirov_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/presentation/auth_bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookRemoteDataSourceImpl.initParse();
  await BookHiveDataSourceImpl.initHive();
  await di.init();

  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _userPrefs;
  bool _userLoggedIn = false;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => _userPrefs = prefs);
      _loadUserPrefs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(_userLoggedIn.toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBLoC>(create: (context) => di.sl<AuthBLoC>()),
        BlocProvider<RegistrationBloc>(create: (context) => di.sl<RegistrationBloc>()),
        BlocProvider<ChangeThemeBloc>(create: (context) => di.sl<ChangeThemeBloc>()),
        BlocProvider<HomeBooksBloc>(create: (context) => di.sl<HomeBooksBloc>()),
        BlocProvider<CategoryBooksBloc>(create: (context) => di.sl<CategoryBooksBloc>()),
        BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
        BlocProvider<FavouritesBloc>(create: (context) => di.sl<FavouritesBloc>()),
        BlocProvider<OrdersBloc>(create: (context) => di.sl<OrdersBloc>()),
      ],
      child: BlocBuilder<ChangeThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'BBT Kirov App',
            theme: state.isDark ? darkTheme() : lightTheme(),
            debugShowCheckedModeBanner: false,
            home: _userLoggedIn ? const HomePage() : const AuthPage(),
          );
        },
      ),
    );
  }

  void _loadUserPrefs() {
    setState(() {
      _userLoggedIn = _userPrefs.getBool(AppConstants.loggedInPref) ?? false;
    });
  }
}
