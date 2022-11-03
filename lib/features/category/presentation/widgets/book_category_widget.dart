import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCategory extends StatelessWidget {
  const BooksCategory({super.key, required this.idCategory});
  final int idCategory;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBooksBySizeBloc>(context)
        .add(const CategoryLoadBooksEvent(param: 'small'));

    return BlocBuilder<CategoryBooksBySizeBloc, CategoryBooksState>(
        builder: (context, state) {
      List<BookEntity> categoryBooks = [];

      if (state is CategoryBooksLoading) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return loadingIndicator();
            },
          ),
        );
      }
      if (state is CategoryBooksLoaded) {
        categoryBooks = state.books;
        if (categoryBooks.isEmpty) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return showErrorText('Books are not loaded');
              },
            ),
          );
        }
      } else if (state is CategoryBooksError) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return showErrorText(state.message);
            },
          ),
        );
      } else {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return loadingIndicator();
            },
          ),
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
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
      );
    });
  }
}
