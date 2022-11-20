import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';

bool isTapped = false;

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.book});
  final BookEntity book;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
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
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.book.name),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                })
          ],
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
                  widget.book.image ??
                      'https://master-kraski.ru/images/no-image.jpg',
                  height: isTapped ? 370 : 270,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                widget.book.name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: AppColors.greyColor2, fontSize: 18),
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
                    //color: AppColors.greyColor2,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            onPressed: _decrement,
                            icon: const Icon(Icons.remove),
                            iconSize: 30,
                            color: Theme.of(context).primaryColor),
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
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        /*  const VerticalDivider(
                            width: 2, color: AppColors.greyColor2), */
                        const SizedBox(width: 20),
                        IconButton(
                            onPressed: _increment,
                            icon: const Icon(Icons.add),
                            iconSize: 30,
                            color: Theme.of(context).primaryColor),
                      ]),
                ),
                Text(
                  'Цена ${widget.book.price} ₽',
                  style: const TextStyle(
                      fontSize: 25, color: AppColors.greyColor2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  fixedSize: const Size(320, 50),
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('ДОБАВИТЬ В КОРЗИНУ'),
            ),
          ],
        )),
      );
    });
  }
}
