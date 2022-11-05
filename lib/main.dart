import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/core/datasources/remote_data_source.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
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
      child: MaterialApp(
        title: 'BBT Kirov App',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
