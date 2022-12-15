import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';

Widget builderWidgetCategory(
    BuildContext context, List<BookEntity> categoryBooks) {
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
