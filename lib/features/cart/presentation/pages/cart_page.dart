import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
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
  void initState() {
    context.read<CartBloc>().add(ShowCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          List<CartBookEntity> cartBooks = [];
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
                        color: AppColors.greyColor2, fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: ElevatedButton(
                    onPressed: () {
                      OrderEntity order = OrderEntity(
                        username: 'a',
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
                        textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    child: const Text('ОТПРАВИТЬ ЗАКАЗ'),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
