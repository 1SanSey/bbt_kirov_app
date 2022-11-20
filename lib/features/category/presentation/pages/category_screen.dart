import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/book_list_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.idCategory});
  final int idCategory;

  @override
  Widget build(BuildContext context) {
    String? nameCategory;
    String query = '';
    if (idCategory == 0) {
      nameCategory = 'Все книги';
      query = 'all';
    } else if (idCategory == 1) {
      nameCategory = 'Маленькие книги';
      query = 'small';
    } else if (idCategory == 2) {
      nameCategory = 'Средние книги';
      query = 'medium';
    } else if (idCategory == 3) {
      nameCategory = 'Большие книги';
      query = 'big';
    } else if (idCategory == 4) {
      nameCategory = 'Махабольшие книги';
      query = 'maha big';
    } else if (idCategory == 5) {
      nameCategory = 'Бхагавад-гита';
      query = 'Бхагавад-гита';
    } else if (idCategory == 6) {
      nameCategory = 'Шримад Бхагаватам';
      query = 'Шримад Бхагаватам';
    } else if (idCategory == 7) {
      nameCategory = 'Шри Чайтанья Чаритамрита';
      query = 'Чайтанья Чаритамрита';
    } else if (idCategory == 8) {
      nameCategory = 'Комплекты';
      query = 'set';
    } else if (idCategory == 9) {
      nameCategory = 'Кулинарные';
      query = 'culinary';
    }
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(nameCategory ?? ''),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: MultiBlocProvider(
          providers: [
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
          child: BooksCategoryWidget(
            query: query,
          ),
        ),
      );
    });
  }
}
