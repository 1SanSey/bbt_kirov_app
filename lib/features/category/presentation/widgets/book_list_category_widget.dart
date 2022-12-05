import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCategoryWidget extends StatefulWidget {
  const BooksCategoryWidget({super.key, required this.query});
  final String query;

  @override
  State<BooksCategoryWidget> createState() => _BooksCategoryWidgetState();
}

class _BooksCategoryWidgetState extends State<BooksCategoryWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BookEntity> categoryBooks = [];
// Загрузка всех книг
    if (widget.query == 'all') {
      BlocProvider.of<CategoryAllBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryAllBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка книг по наименованию
    if (widget.query == 'Бхагавад-гита' ||
        widget.query == 'Шримад Бхагаватам' ||
        widget.query == 'Чайтанья Чаритамрита') {
      BlocProvider.of<CategoryBooksByNameBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryBooksByNameBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка книг по размеру
    if (widget.query == 'small' ||
        widget.query == 'medium' ||
        widget.query == 'big' ||
        widget.query == 'maha big') {
      BlocProvider.of<CategoryBooksBySizeBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryBooksBySizeBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка наборов книг
    if (widget.query == 'set') {
      BlocProvider.of<CategoryBooksSetBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryBooksSetBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    // Загрузка кулинарных книг
    if (widget.query == 'culinary') {
      BlocProvider.of<CategoryCulinaryBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryCulinaryBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        return builderWidgetCategory(context, state, categoryBooks);
      });
    }

    return const SizedBox.shrink();
  }
}
