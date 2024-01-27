import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:bbt_kirov_app/features/domain/entities/cart_book_entity.dart';
import 'package:bbt_kirov_app/features/domain/entities/favorites_book_entity.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesBookCard extends StatefulWidget {
  final FavoritesBookEntity book;
  final int index;

  const FavouritesBookCard({
    required this.book,
    super.key,
    required this.index,
  });

  @override
  State<FavouritesBookCard> createState() => _FavouritesBookCardState();
}

class _FavouritesBookCardState extends State<FavouritesBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: AppColors.greyColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.network(
                  widget.book.image,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.book.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        S.current.price(widget.book.price),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                book: CartBookEntity(
                  name: widget.book.name,
                  price: widget.book.price,
                  image: widget.book.image,
                  quantity: 1,
                ),
              ));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
