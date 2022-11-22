import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/book_list_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.idCategory});
  final int idCategory;
  late var _state;

  @override
  Widget build(BuildContext context) {
    String? nameCategory;
    late String query;
    switch (idCategory) {
      case 0:
        {
          nameCategory = 'Все книги';
          query = 'all';
          break;
        }
      case 1:
        {
          nameCategory = 'Маленькие книги';
          query = 'small';
          break;
        }
      case 2:
        {
          nameCategory = 'Средние книги';
          query = 'medium';

          break;
        }
      case 3:
        {
          nameCategory = 'Большие книги';
          query = 'big';

          break;
        }
      case 4:
        {
          nameCategory = 'Махабольшие книги';
          query = 'maha big';

          break;
        }
      case 5:
        {
          nameCategory = 'Бхагавад-гита';
          query = 'Бхагавад-гита';

          break;
        }
      case 6:
        {
          nameCategory = 'Шримад Бхагаватам';
          query = 'Шримад Бхагаватам';

          break;
        }
      case 7:
        {
          nameCategory = 'Шри Чайтанья Чаритамрита';
          query = 'Чайтанья Чаритамрита';

          break;
        }
      case 8:
        {
          nameCategory = 'Комплекты';
          query = 'set';

          break;
        }

      case 9:
        {
          nameCategory = 'Кулинарные';
          query = 'culinary';

          break;
        }
      default:
        {
          nameCategory = 'Выбранная категория';
          query = '';
          break;
        }
    }
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                switch (idCategory) {
                  case 0:
                    {
                      _state = BlocProvider.of<CategoryAllBooksBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();

                      break;
                    }
                  case 1:
                    {
                      _state = BlocProvider.of<CategoryBooksBySizeBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 2:
                    {
                      _state = BlocProvider.of<CategoryBooksBySizeBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 3:
                    {
                      _state = BlocProvider.of<CategoryBooksBySizeBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 4:
                    {
                      _state = BlocProvider.of<CategoryBooksBySizeBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 5:
                    {
                      nameCategory = 'Бхагавад-гита';
                      query = 'Бхагавад-гита';
                      _state = BlocProvider.of<CategoryBooksByNameBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 6:
                    {
                      _state = BlocProvider.of<CategoryBooksByNameBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 7:
                    {
                      _state = BlocProvider.of<CategoryBooksByNameBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  case 8:
                    {
                      _state = BlocProvider.of<CategoryBooksSetBloc>(context)
                          .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }

                  case 9:
                    {
                      _state =
                          BlocProvider.of<CategoryCulinaryBooksBloc>(context)
                              .state as CategoryBooksLoaded;
                      _state.books.clear();
                      break;
                    }
                  default:
                    {
                      break;
                    }
                }

                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(nameCategory ?? ''),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: /* MultiBlocProvider(
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
          child: */
            BooksCategoryWidget(
          query: query,
        ),
      );
      //);
    });
  }
}
