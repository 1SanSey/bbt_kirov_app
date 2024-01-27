import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/home_books_bloc/home_books_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/ui/widgets/book_card_widget.dart';
import 'package:bbt_kirov_app/features/presentation/ui/widgets/error_text_widget.dart';
import 'package:bbt_kirov_app/features/presentation/ui/widgets/loading_indicator.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListWidget extends StatefulWidget {
  const BooksListWidget({super.key});

  @override
  State<BooksListWidget> createState() => _BooksListHomeState();
}

class _BooksListHomeState extends State<BooksListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBooksBloc>().add(HomeLoadBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBooksBloc, HomeBooksState>(builder: (context, state) {
      List<BookEntity> homeBooks = [];

      if (state is HomeBooksLoading) {
        return const SliverToBoxAdapter(child: LoadingIndicator());
      }
      if (state is HomeBooksLoaded) {
        homeBooks = state.books;
        if (homeBooks.isEmpty) {
          return SliverToBoxAdapter(child: ErrorTextWidget(errorMessage: S.current.booksNotLoaded));
        }
      } else if (state is HomeBooksError) {
        return SliverToBoxAdapter(child: ErrorTextWidget(errorMessage: state.message));
      } else {
        return const SliverToBoxAdapter(child: LoadingIndicator());
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
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 270,
          ),
        ),
      );
    });
  }
}
