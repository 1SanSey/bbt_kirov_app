import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/cart/presentation/widgets/cart_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(ShowCartEvent());
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        List<CartBookModel> cartBooks = [];
        int totalSum = 0;
        Map<String, int> orderBooks = {};

        if (state is ShowCartState) {
          cartBooks = state.books;
          totalSum = state.totalSum;
          for (var value in cartBooks) {
            orderBooks.addAll({value.name: value.quantity});
          }
          if (cartBooks.isEmpty) {
            return showErrorText('Ваша корзина пуста');
          }
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
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
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CartBookCard(
                      book: cartBooks[index],
                      index: index,
                    );
                  },
                  childCount: cartBooks.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Общая сумма: $totalSum ₽',
                  style: const TextStyle(
                      color: AppColors.greyColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: ElevatedButton(
                  onPressed: () {
                    OrderEntity order = OrderEntity(
                      dateOrder: DateTime.now(),
                      sumOrder: totalSum,
                      books: orderBooks,
                    );

                    context.read<CartBloc>().add(SendOrderEvent(order: order));
                    setState(() {
                      context.read<CartBloc>().add(ShowCartEvent());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      fixedSize: const Size(320, 50),
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('ОТПРАВИТЬ ЗАКАЗ'),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
