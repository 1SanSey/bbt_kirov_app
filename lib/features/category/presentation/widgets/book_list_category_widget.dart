import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCategoryWidget extends StatefulWidget {
  const BooksCategoryWidget({super.key, required this.query});
  final String query;

  @override
  State<BooksCategoryWidget> createState() => _BooksCategoryWidgetState();
}

class _BooksCategoryWidgetState extends State<BooksCategoryWidget> {
  List<BookEntity> _categoryBooks = [];
  List<BookEntity> _foundBooks = [];

  @override
  void initState() {
    _foundBooks = _categoryBooks;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<BookEntity> results = [];
    if (enteredKeyword.isEmpty) {
      results = _categoryBooks;
    } else {
      results = _categoryBooks
          .where((book) =>
              book.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

      setState(() {
        _foundBooks = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
// Загрузка всех книг, нужно сделать, чтобы при обращении данные блока обновлялись initState? или instance
    if (widget.query == 'all') {
      BlocProvider.of<CategoryAllBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryAllBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        if (state is CategoryBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is CategoryBooksLoaded) {
          _categoryBooks = state.books;
          _foundBooks = _categoryBooks;
          if (_categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }

        return CustomScrollView(slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
            sliver: SliverToBoxAdapter(
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: 'Поиск',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BookCard(book: _foundBooks[index]);
                },
                childCount: _foundBooks.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 270,
              ),
            ),
          ),
        ]);
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
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }

        return CustomScrollView(slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BookCard(book: categoryBooks[index]);
                },
                childCount: categoryBooks.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 270,
              ),
            ),
          ),
        ]);
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
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }

        return CustomScrollView(slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BookCard(book: categoryBooks[index]);
                },
                childCount: categoryBooks.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 270,
              ),
            ),
          ),
        ]);
      });
    }

    // Загрузка наборов книг
    if (widget.query == 'set') {
      BlocProvider.of<CategoryBooksSetBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryBooksSetBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }

        return CustomScrollView(slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BookCard(book: categoryBooks[index]);
                },
                childCount: categoryBooks.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 270,
              ),
            ),
          ),
        ]);
      });
    }

    // Загрузка кулинарных книг
    if (widget.query == 'culinary') {
      BlocProvider.of<CategoryCulinaryBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: widget.query));

      return BlocBuilder<CategoryCulinaryBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }

        return CustomScrollView(slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BookCard(book: categoryBooks[index]);
                },
                childCount: categoryBooks.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 270,
              ),
            ),
          ),
        ]);
      });
    }

    return const SizedBox();
  }
}
