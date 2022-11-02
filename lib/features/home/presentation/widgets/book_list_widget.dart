import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_card_widget.dart';
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
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return loadingIndicator();
            },
          ),
        );
      }
      if (state is HomeBooksLoaded) {
        homeBooks = state.books;
        if (homeBooks.isEmpty) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _showErrorText('Books are not loaded');
              },
            ),
          );
        }
      } else if (state is HomeBooksError) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _showErrorText(state.message);
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

  Widget _showErrorText(String errorMessage) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Text(
          errorMessage,
          style: const TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
}
