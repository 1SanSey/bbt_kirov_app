import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:bbt_kirov_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderWidgetCategory extends StatelessWidget {
  final List<BookEntity> categoryBooks;
  final TextEditingController searchController;
  final FocusNode? focusNode;

  const BuilderWidgetCategory(BuildContext context,
      {super.key,
      required this.searchController,
      this.focusNode,
      required this.categoryBooks});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            showCursor: true,
            focusNode: focusNode,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                hintText: 'Поиск по названию',
                fillColor: AppColors.greyColor),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8),
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

  void _onSearchInput(BuildContext context, String text) {
    context.read<CategoryBooksBloc>().add(
          CategorySearchBooksEvent(
            query: text,
          ),
        );
  }
}
