import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCategoryWidget extends StatelessWidget {
  const BooksCategoryWidget({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    List<BookEntity> categoryBooks = [];
// Загрузка всех книг
    if (query == 'all') {
      BlocProvider.of<CategoryAllBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryAllBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка книг по наименованию
    if (query == 'Бхагавад-гита' ||
        query == 'Шримад Бхагаватам' ||
        query == 'Чайтанья Чаритамрита') {
      BlocProvider.of<CategoryBooksByNameBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksByNameBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка книг по размеру
    if (query == 'small' ||
        query == 'medium' ||
        query == 'big' ||
        query == 'maha big') {
      BlocProvider.of<CategoryBooksBySizeBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksBySizeBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка наборов книг
    if (query == 'set') {
      BlocProvider.of<CategoryBooksSetBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksSetBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка кулинарных книг
    if (query == 'culinary') {
      BlocProvider.of<CategoryCulinaryBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryCulinaryBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    return const SizedBox.shrink();
  }
}
