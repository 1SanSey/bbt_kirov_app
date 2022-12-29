import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/widgets/favourites_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavouritesBloc>().add(ShowFavouritesEvent());
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        List<FavouritesBookModel> favouritesBooks = [];

        if (state is ShowFavouritesState) {
          favouritesBooks = state.books;
          if (favouritesBooks.isEmpty) {
            return showErrorText('Список избранных книг пуст');
          }
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Избранное',
                    style: TextStyle(
                        color: AppColors.greyColor2,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              sliver: favouritesBooks.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return FavouritesBookCard(
                            book: favouritesBooks[index],
                            index: index,
                          );
                        },
                        childCount: favouritesBooks.length,
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Список избранных книг пуст',
                          style: TextStyle(
                              color: AppColors.greyColor2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
            ),
          ]),
        );
      },
    );
  }
}
