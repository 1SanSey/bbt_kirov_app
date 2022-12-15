import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/common/loading_indicator.dart';
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
    // Загрузка всех книг
    if (widget.query == 'all') {
      BlocProvider.of<CategoryBooksBloc>(context)
          .add(CategoryLoadAllBooksEvent(param: widget.query));
    }

    // Загрузка книг по наименованию
    if (widget.query == 'Бхагавад-гита' ||
        widget.query == 'Шримад Бхагаватам' ||
        widget.query == 'Чайтанья Чаритамрита') {
      BlocProvider.of<CategoryBooksBloc>(context)
          .add(CategoryLoadBooksByNameEvent(param: widget.query));
    }

    // Загрузка книг по размеру
    if (widget.query == 'small' ||
        widget.query == 'medium' ||
        widget.query == 'big' ||
        widget.query == 'maha big') {
      BlocProvider.of<CategoryBooksBloc>(context)
          .add(CategoryLoadBooksBySizeEvent(param: widget.query));
    }

    // Загрузка наборов книг
    if (widget.query == 'set') {
      BlocProvider.of<CategoryBooksBloc>(context)
          .add(CategoryLoadBooksSetEvent(param: widget.query));
    }

    // Загрузка кулинарных книг
    if (widget.query == 'culinary') {
      BlocProvider.of<CategoryBooksBloc>(context)
          .add(CategoryLoadCulinaryBooksEvent(param: widget.query));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BookEntity> categoryBooks = [];
    bool error = false;
    String errorText = '';
    return BlocSelector<CategoryBooksBloc, CategoryBooksState, bool>(
        selector: (state) {
      if (state is CategoryBooksEmpty) {
        return false;
      }
      if (state is CategoryBooksLoading) {
        return false;
      }
      if (state is CategoryBooksLoaded) {
        categoryBooks = state.books;

        if (categoryBooks.isEmpty) {
          error = true;
          errorText = 'Error! Books are not loaded';
          return false;
        }
        return true;
      } else if (state is CategoryBooksError) {
        error = true;
        errorText = state.message;
        return false;
      } else {
        return false;
      }
    }, builder: (context, state) {
      if (state) {
        return builderWidgetCategory(context, categoryBooks);
      } else {
        if (error) {
          showErrorText(errorText);
        }
      }
      return loadingIndicator(context);
    });
  }
}
