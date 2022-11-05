import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_list_home_widget.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/top_home_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: CustomScrollView(slivers: [
        TopHomeWidget(),
        BooksListHome(),
      ]),
    );
  }
}
