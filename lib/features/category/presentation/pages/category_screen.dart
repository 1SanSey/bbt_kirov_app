import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/book_list_category_widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.idCategory});
  final int idCategory;

  @override
  Widget build(BuildContext context) {
    String? nameCategory;
    String query = '';
    if (idCategory == 0) {
      nameCategory = 'Все книги';
      query = 'all';
    } else if (idCategory == 1) {
      nameCategory = 'Маленькие книги';
      query = 'small';
    } else if (idCategory == 2) {
      nameCategory = 'Средние книги';
      query = 'medium';
    } else if (idCategory == 3) {
      nameCategory = 'Большие книги';
      query = 'big';
    } else if (idCategory == 4) {
      nameCategory = 'Махабольшие книги';
      query = 'maha big';
    } else if (idCategory == 5) {
      nameCategory = 'Бхагавад-гита';
      query = 'Бхагавад-гита';
    } else if (idCategory == 6) {
      nameCategory = 'Шримад Бхагаватам';
      query = 'Шримад Бхагаватам';
    } else if (idCategory == 7) {
      nameCategory = 'Шри Чайтанья Чаритамрита';
      query = 'Чайтанья Чаритамрита';
    } else if (idCategory == 8) {
      nameCategory = 'Комплекты';
      query = 'set';
    } else if (idCategory == 9) {
      nameCategory = 'Кулинарные';
      query = 'culinary';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(nameCategory ?? 'Selected Category'),
        centerTitle: true,
        backgroundColor: AppColors.mainBackground,
        actions: [
          IconButton(
            onPressed: () {
              //showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: BooksCategoryWidget(
        query: query,
      ),
    );
  }
}
