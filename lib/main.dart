import 'package:bbt_kirov_app/core/themes/change_theme_bloc.dart';
import 'package:bbt_kirov_app/core/themes/themes.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/core/datasources/book_hive_datasource.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/reg_bloc/registration_bloc.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_books_bloc.dart';
import 'package:bbt_kirov_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:bbt_kirov_app/navigation/navigation_manager.dart';
import 'package:bbt_kirov_app/navigation/route_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
        BlocProvider<RegistrationBloc>(create: (context) => di.sl<RegistrationBloc>()),
        BlocProvider<ChangeThemeBloc>(create: (context) => di.sl<ChangeThemeBloc>()),
        BlocProvider<HomeBooksBloc>(create: (context) => di.sl<HomeBooksBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => di.sl<CategoryBloc>()),
        BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
        BlocProvider<FavouritesBloc>(create: (context) => di.sl<FavouritesBloc>()),
        BlocProvider<OrdersBloc>(create: (context) => di.sl<OrdersBloc>()),
      ],
      child: BlocBuilder<ChangeThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'BBT Kirov App',
            theme: state.isDark ? darkTheme() : lightTheme(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale.fromSubtags(languageCode: 'ru'),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.instance.key,
            routes: RouteBuilder.routes,
            initialRoute: RouteBuilder.initialRoute,
            onGenerateRoute: RouteBuilder.onGenerateRoute,
          );
        },
      ),
    );
  }
}
