import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/favorites/domain/entities/favorites_book_entity.dart';
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
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      /*  margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: AppColors.greyColor,
          width: 1,
        ),
      ), */
      child: Container(
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
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Цена: ${widget.book.price} ₽',
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
                  CartBookModel hiveBook = CartBookModel(
                      name: widget.book.name,
                      price: widget.book.price,
                      image: widget.book.image,
                      quantity: 1);
                  BlocProvider.of<CartBloc>(context)
                      .add(AddToCartEvent(book: hiveBook));
                  //showSnackBarAddToCart(context);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                  size: 27,
                )),
            /*Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                
                GestureDetector(
                  onTap: () {
                    CartBookModel hiveBook = CartBookModel(
                      name: widget.book.name,
                      price: widget.book.price,
                      image: widget.book.image,
                      quantity: 1,
                    );
      
                    BlocProvider.of<CartBloc>(context)
                        .add(AddToCartEvent(book: hiveBook));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Text(
                      'Добавить в корзину',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavouritesBloc>(context).add(
                        RemoveFromFavouritesEvent(
                            book: widget.book, index: widget.index));
      
                    BlocProvider.of<FavouritesBloc>(context)
                        .add(ShowFavouritesEvent());
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Удалить из списка',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    ),
                  ),
                ),
      
                 ElevatedButton(
                  onPressed: () {
                    FavouritesBookModel hiveBook = FavouritesBookModel(
                      name: widget.book.name,
                      price: widget.book.price,
                      image: widget.book.image,
                    );
      
                    BlocProvider.of<FavouritesBloc>(context)
                        .add(AddToFavouritesEvent(book: hiveBook));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('В КОРЗИНУ'),
                ), 
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
