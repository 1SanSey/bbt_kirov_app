import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBookCard extends StatefulWidget {
  final BookEntity book;

  const CartBookCard({required this.book, super.key});

  @override
  State<CartBookCard> createState() => _CartBookCardState();
}

class _CartBookCardState extends State<CartBookCard> {
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
              width: MediaQuery.of(context).size.width * 0.55,
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      context
                          .read<CartBloc>()
                          .add(RemoveFromCartEvent(param: widget.book));
                      context.read<CartBloc>().add(ShowCartEvent());
                    });
                  } /* _decrement */,
                  icon: const Icon(Icons.remove),
                  iconSize: 15,
                  color: Theme.of(context).primaryColor),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  '$_count',
                  style: const TextStyle(
                      color: AppColors.greyColor2,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              IconButton(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  iconSize: 15,
                  color: Theme.of(context).primaryColor),
            ]),
          ],
        ),
      ),
    );
  }
}
