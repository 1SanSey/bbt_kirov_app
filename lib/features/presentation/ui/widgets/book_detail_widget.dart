import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:bbt_kirov_app/features/data/models/cart_book_model/cart_book_model.dart';
import 'package:bbt_kirov_app/features/data/models/favourites_book_model/favourites_book_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/favourites_bloc/favourites_bloc.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.book});
  final BookEntity book;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool isTapped = false;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.book.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                });
              },
              child: AnimatedSize(
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Image.network(
                  widget.book.image ?? 'https://master-kraski.ru/images/no-image.jpg',
                  height: isTapped ? 370 : 270,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: Text(
                widget.book.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.greyColor2, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: 1,
                    ),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    IconButton(
                      onPressed: _decrement,
                      icon: const Icon(Icons.remove),
                      iconSize: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 20),
                    /* const VerticalDivider(
                            width: 2, color: AppColors.greyColor2), */
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '$_count',
                        style: const TextStyle(
                          color: AppColors.greyColor2,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    /*  const VerticalDivider(
                            width: 2, color: AppColors.greyColor2), */
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: _increment,
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ]),
                ),
                Text(
                  S.current.price(widget.book.price),
                  style: const TextStyle(fontSize: 25, color: AppColors.greyColor2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                  book: CartBookModel(
                    name: widget.book.name,
                    price: widget.book.price,
                    image: widget.book.image!,
                    quantity: _count,
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                fixedSize: const Size(320, 50),
                textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(S.current.addToCart),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                final FavouritesBookModel hiveBook = FavouritesBookModel(
                  name: widget.book.name,
                  price: widget.book.price,
                  image: widget.book.image!,
                );

                BlocProvider.of<FavouritesBloc>(context).add(AddToFavouritesEvent(book: hiveBook));
              },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(320, 50),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                foregroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                S.current.addToFavourites,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
