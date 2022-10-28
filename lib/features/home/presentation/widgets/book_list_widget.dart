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
        loadingIndicator();
      }
      if (state is HomeBooksLoaded) {
        homeBooks = state.books;
        if (homeBooks.isEmpty) {
          return _showErrorText('Books are not loaded');
        }
      } else if (state is HomeBooksError) {
        return Center(child: _showErrorText(state.message));
      } else {
        return Center(
          child: loadingIndicator(),
          //child: Icon(Icons.now_wallpaper),
        );
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 12, left: 12),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              mainAxisExtent: 270,
            ),
            itemBuilder: (context, index) {
              return BookCard(book: homeBooks[index]);
            },
            itemCount: homeBooks.length),
      );
    });
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: Colors.black,
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
