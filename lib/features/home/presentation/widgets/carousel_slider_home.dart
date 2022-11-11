import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderHome extends StatelessWidget {
  CarouselSliderHome({super.key});

  final List<String> imagesList = [
    'lib/core/assets/images/1_quote.jpg',
    'lib/core/assets/images/2_quote.jpg',
    'lib/core/assets/images/3_quote.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10, bottom: 4, right: 8, left: 8),
      sliver: SliverToBoxAdapter(
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.8,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: imagesList
              .map(
                (item) => Card(
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  elevation: 6.0,
                  shadowColor: AppColors.greyColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      item,
                      //width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}