import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';

Widget builderWidgetCategory(BuildContext context, CategoryBooksState state,
    List<BookEntity> categoryBooks) {
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
      padding: const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
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
}
