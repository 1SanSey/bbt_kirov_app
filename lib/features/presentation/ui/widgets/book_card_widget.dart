import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:bbt_kirov_app/features/data/models/cart_book_model/cart_book_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;

  const BookCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: AppColors.greyColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => NavigationManager.instance.goBookDetailPage(book),
            child: Column(
              children: [
                Image.network(
                  book.image ?? 'https://master-kraski.ru/images/no-image.jpg',
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    book.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Text(
                '${book.price} ₽',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                    book: CartBookModel(
                      name: book.name,
                      price: book.price,
                      image: book.image!,
                      quantity: 1,
                    ),
                  ));
                  //showSnackBarAddToCart(context);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),

              /* BlocListener<CartBloc, CartState>(
                    listener: ((context, state) {
                      if (state is AddToCartState) {
                        String message = state.message;
          
                        
                      }
                    }),
                    child: const SizedBox.shrink(),
                  ),  */
            ]),
          ),
        ],
      ),
    );
  }

  /* void showSnackBarAddToCart(BuildContext context) {
    var scaffoldMessenger = ScaffoldMessenger.of(context);
    BlocListener<CartBloc, CartState>(
      listener: ((_, state) {
        log(state.toString());

        if (state is AddToCartState) {
          String message = state.message;
          log(message);
          scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
        }
      }),
    );
  } */
}
