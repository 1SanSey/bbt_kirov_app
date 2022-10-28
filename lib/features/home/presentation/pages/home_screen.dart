import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 12, left: 12),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: 'Поиск',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Популярные',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: AppColors.greyColor2,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 16),
            BooksListHome(),
          ],
        ),
      ),
    );
  }
}
