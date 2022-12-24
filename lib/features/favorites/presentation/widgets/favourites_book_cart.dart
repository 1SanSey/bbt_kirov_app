import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FavouritesBookCard extends StatefulWidget {
  final BookEntity book;

  const FavouritesBookCard({required this.book, super.key});

  @override
  State<FavouritesBookCard> createState() => _FavouritesBookCardState();
}

class _FavouritesBookCardState extends State<FavouritesBookCard> {
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
                widget.book.image ??
                    'https://master-kraski.ru/images/no-image.jpg',
                height: 40,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Цена: ${widget.book.price} руб.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('В КОРЗИНУ'),
            ),
          ],
        ),
      ),
    );
  }
}
