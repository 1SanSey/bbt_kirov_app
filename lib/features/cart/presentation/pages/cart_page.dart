import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/cart/presentation/widgets/cart_book_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(ShowCartEvent());
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<BookEntity> cartBooks = [];

        if (state is ShowCartState) {
          cartBooks = state.books;
          if (cartBooks.isEmpty) {
            return showErrorText('Cart is empty');
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
              sliver: cartBooks.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CartBookCard(book: cartBooks[index]);
                        },
                        childCount: cartBooks.length,
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
