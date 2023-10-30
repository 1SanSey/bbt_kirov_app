import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListHome extends StatelessWidget {
  const BooksListHome({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBooksBloc>(context).add(HomeLoadBooksEvent());
    return BlocBuilder<HomeBooksBloc, HomeBooksState>(
        builder: (context, state) {
      List<BookEntity> homeBooks = [];

      if (state is HomeBooksLoading) {
        return SliverToBoxAdapter(child: loadingIndicator(context));
      }
      if (state is HomeBooksLoaded) {
        homeBooks = state.books;
        if (homeBooks.isEmpty) {
          return SliverToBoxAdapter(
              child: showErrorText('Books are not loaded'));
        }
      } else if (state is HomeBooksError) {
        return SliverToBoxAdapter(child: showErrorText(state.message));
      } else {
        return SliverToBoxAdapter(child: loadingIndicator(context));
      }

      return SliverPadding(
        padding: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BookCard(book: homeBooks[index]);
            },
            childCount: homeBooks.length,
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
