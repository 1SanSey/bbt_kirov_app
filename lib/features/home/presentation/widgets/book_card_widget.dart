import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;

  const BookCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.greyColor,
          width: 2,
        ),
        /*gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.greyColor, AppColors.greyColor2]),*/
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            book.image ?? 'Icon(icon: Icons.image_rounded)',
            height: 180,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                book.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.greyColor2,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.mainBackground,
                      size: 30,
                    )),
                Text(
                  '${book.price} ₽',
                  style: const TextStyle(
                    color: AppColors.mainBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
