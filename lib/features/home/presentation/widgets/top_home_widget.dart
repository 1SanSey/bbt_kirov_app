import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/features/category/presentation/pages/category_screen.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                var state = BlocProvider.of<HomeBooksBloc>(context).state
                    as HomeBooksLoaded;

                state.books.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(idCategory: index),
                  ),
                );
              },
              child: Center(
                child: Text(
                  AppConstants.category[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          },
          childCount: AppConstants.category.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          mainAxisExtent: 50,
        ),
      ),
    );
  }
}
