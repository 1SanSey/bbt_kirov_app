import 'package:bbt_kirov_app/common/error_text.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late int _count;

  @override
  void initState() {
    _count = 1;
    super.initState();
  }

  void _increment() {
    setState(() {
      ++_count;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 1) {
        --_count;
      } else {
        _count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(ShowCartEvent());
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<CartBookModel> cartBooks = [];

        if (state is ShowCartState) {
          cartBooks = state.books;
          if (cartBooks.isEmpty) {
            return showErrorText('Ваша корзина пуста');
          }
        }
        void increment(int index, int value) {
          setState(() {
            ++value;
            context
                .read<CartBloc>()
                .add(ChangeQuantityCartEvent(index: index, value: value));
          });
        }

        void decrement(int index, int value) {
          setState(() {
            if (value > 1) {
              --value;
            } else {
              value;
            }
            context
                .read<CartBloc>()
                .add(ChangeQuantityCartEvent(index: index, value: value));
          });
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
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Material(
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.greyColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: Image.network(
                                cartBooks[index].image,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartBooks[index].name,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Цена: ${cartBooks[index].price} ₽',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () => decrement(
                                                    index,
                                                    cartBooks[index].quantity),
                                                icon: const Icon(Icons.remove),
                                                iconSize: 20,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                            Text(
                                              '${cartBooks[index].quantity}',
                                              style: const TextStyle(
                                                  color: AppColors.greyColor2,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            IconButton(
                                                onPressed: () => increment(
                                                    index,
                                                    cartBooks[index].quantity),
                                                icon: const Icon(Icons.add),
                                                iconSize: 20,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ],
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            /* Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.greyColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ), */
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      context.read<CartBloc>().add(
                                          RemoveFromCartEvent(
                                              book: cartBooks[index],
                                              index: index));
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: cartBooks.length,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
