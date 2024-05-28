import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class CarouselPizza extends StatelessWidget {
  final double carouselHeight;
  final List<String> photos;
  const CarouselPizza({
    super.key,
    required this.carouselHeight,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: carouselHeight,
      decoration: const BoxDecoration(
        color: MyColors.light,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.1,
          height: carouselHeight,
        ),
        items: photos.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: MyColors.light,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
