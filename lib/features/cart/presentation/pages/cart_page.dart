import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/common/loading_indicator.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/presentation/widgets/cart_book_cart.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBooksBloc>().add(HomeLoadBooksEvent());
    return BlocBuilder<HomeBooksBloc, HomeBooksState>(
      builder: (context, state) {
        List<BookEntity> homeBooks = [];

        if (state is HomeBooksLoading) {
          return loadingIndicator(context);
        }
        if (state is HomeBooksLoaded) {
          homeBooks = state.books;
          if (homeBooks.isEmpty) {
            return showErrorText('Books are not loaded');
          }
        } else if (state is HomeBooksError) {
          return showErrorText(state.message);
        } else {
          return loadingIndicator(context);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Корзина',
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
              sliver: homeBooks.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CartBookCard(book: homeBooks[index]);
                        },
                        childCount: homeBooks.length,
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Ваша корзина пуста',
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
