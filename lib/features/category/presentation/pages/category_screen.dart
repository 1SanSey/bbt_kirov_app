import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/book_category_widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BBT Kirov'),
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
      body: const CustomScrollView(
        slivers: <Widget>[
          BooksCategoryWidget(
            idCategory: 1,
          ),
        ],
      ),
    );
  }
}
