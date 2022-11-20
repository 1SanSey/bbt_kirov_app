import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/themes/themes.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookRemoteDataSourceImpl.initParse();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return /* MultiBlocProvider(
      providers: [
        BlocProvider<HomeBooksBloc>(
            create: (context) => di.sl<HomeBooksBloc>()),
        BlocProvider<CategoryAllBooksBloc>(
            create: (context) => di.sl<CategoryAllBooksBloc>()),
        BlocProvider<CategoryBooksBySizeBloc>(
            create: (context) => di.sl<CategoryBooksBySizeBloc>()),
        BlocProvider<CategoryBooksByNameBloc>(
            create: (context) => di.sl<CategoryBooksByNameBloc>()),
        BlocProvider<CategoryBooksSetBloc>(
            create: (context) => di.sl<CategoryBooksSetBloc>()),
        BlocProvider<CategoryCulinaryBooksBloc>(
            create: (context) => di.sl<CategoryCulinaryBooksBloc>()),
      ],
      child: */
        ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          title: 'BBT Kirov App',
          theme: themeNotifier.isDark ? darkTheme() : lightTheme(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      }),
    );
    //);
  }
}
