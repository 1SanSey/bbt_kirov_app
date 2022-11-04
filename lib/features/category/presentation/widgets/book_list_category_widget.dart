import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCategoryWidget extends StatelessWidget {
  const BooksCategoryWidget({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
// Загрузка всех книг
    if (query == 'all') {
      BlocProvider.of<CategoryAllBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryAllBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator();
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator();
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

    // Загрузка книг по наименованию
    if (query == 'Бхагавад-гита' ||
        query == 'Шримад Бхагаватам' ||
        query == 'Чайтанья Чаритамрита') {
      BlocProvider.of<CategoryBooksByNameBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksByNameBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator();
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator();
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
    if (query == 'small' ||
        query == 'medium' ||
        query == 'big' ||
        query == 'maha big') {
      BlocProvider.of<CategoryBooksBySizeBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksBySizeBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator();
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator();
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
    if (query == 'set') {
      BlocProvider.of<CategoryBooksSetBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryBooksSetBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator();
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator();
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
    if (query == 'culinary') {
      BlocProvider.of<CategoryCulinaryBooksBloc>(context)
          .add(CategoryLoadBooksEvent(param: query));

      return BlocBuilder<CategoryCulinaryBooksBloc, CategoryBooksState>(
          builder: (context, state) {
        List<BookEntity> categoryBooks = [];

        if (state is CategoryBooksLoading) {
          return loadingIndicator();
        }
        if (state is CategoryBooksLoaded) {
          categoryBooks = state.books;
          if (categoryBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is CategoryBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator();
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
