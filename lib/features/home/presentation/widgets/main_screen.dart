import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_list_home_widget.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/carousel_slider_home.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/top_home_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: const CustomScrollView(slivers: [
        CarouselSliderHome(),
        TopHomeWidget(),
        SliverPadding(
          padding: EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Популярные книги',
                style: TextStyle(
                    color: AppColors.greyColor2, fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        BooksListHome(),
      ]),
    );
  }
}
