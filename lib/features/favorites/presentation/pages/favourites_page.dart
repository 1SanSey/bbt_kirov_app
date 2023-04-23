import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/widgets/favourites_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<FavouritesBookModel> favouritesBooks = [];
  @override
  Widget build(BuildContext context) {
    context.read<FavouritesBloc>().add(ShowFavouritesEvent());
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
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
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Dismissible(
                      background: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColorLight,
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      key:
                          UniqueKey() /* ValueKey<FavouritesBookModel>(
                          favouritesBooks[index]) */
                      ,
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          context.read<FavouritesBloc>().add(
                              RemoveFromFavouritesEvent(
                                  book: favouritesBooks[index], index: index));
                        });
                      },
                      child: FavouritesBookCard(
                        book: favouritesBooks[index],
                        index: index,
                      ),
                    );
                  },
                  childCount: favouritesBooks.length,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
