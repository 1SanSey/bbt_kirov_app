import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';

class BuilderWidgetCategory extends StatefulWidget {
  final List<BookEntity> categoryBooks;

  const BuilderWidgetCategory(BuildContext context, {super.key, required this.categoryBooks});

  @override
  State<BuilderWidgetCategory> createState() => _BuilderWidgetCategoryState();
}

class _BuilderWidgetCategoryState extends State<BuilderWidgetCategory> {
  final FocusNode? focusNode = FocusNode();

  List<BookEntity> _foundBooks = [];

  @override
  void initState() {
    super.initState();
    _foundBooks = widget.categoryBooks;
  }

  void _runFilter(String enteredKeyword) {
    List<BookEntity> resultsBooks = [];
    if (enteredKeyword.isEmpty) {
      resultsBooks = widget.categoryBooks;
    } else {
      resultsBooks = widget.categoryBooks
          .where((book) => book.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundBooks = resultsBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
            child: TextField(
              style: const TextStyle(color: AppColors.greyColor2),
              cursorColor: focusNode!.hasFocus
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorDark,
              focusNode: focusNode,
              showCursor: true,
              textInputAction: TextInputAction.search,
              autocorrect: false,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: focusNode!.hasFocus
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                ),
                filled: true,
                hintText: 'Поиск по названию',
                hintStyle: TextStyle(
                  color: focusNode!.hasFocus
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                ),
                fillColor: AppColors.greyColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.greyColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: focusNode!.hasFocus
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
                    width: 1.0,
                  ),
                ),
              ),
              onChanged: (text) => _runFilter(text),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: _foundBooks.isNotEmpty
              ? SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return BookCard(book: _foundBooks[index]);
                    },
                    childCount: _foundBooks.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    mainAxisExtent: 270,
                  ),
                )
              : const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(
                      child: Text(
                        'Результаты не найдены',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
        ),
      ]),
    );
  }
}
