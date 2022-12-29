import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBookCard extends StatefulWidget {
  final CartBookModel book;
  final int index;
  const CartBookCard({super.key, required this.book, required this.index});

  @override
  State<CartBookCard> createState() => _CartBookCardState();
}

class _CartBookCardState extends State<CartBookCard> {
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Image.network(
                widget.book.image,
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
                    widget.book.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Цена: ${widget.book.price} ₽',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => decrement(
                                    widget.index, widget.book.quantity),
                                icon: const Icon(Icons.remove),
                                iconSize: 20,
                                color: Theme.of(context).primaryColor),
                            Text(
                              '${widget.book.quantity}',
                              style: const TextStyle(
                                  color: AppColors.greyColor2,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                                onPressed: () => increment(
                                    widget.index, widget.book.quantity),
                                icon: const Icon(Icons.add),
                                iconSize: 20,
                                color: Theme.of(context).primaryColor),
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
                      context.read<CartBloc>().add(RemoveFromCartEvent(
                          book: widget.book, index: widget.index));
                    });
                    context.read<CartBloc>().add(ShowCartEvent());
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
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
}