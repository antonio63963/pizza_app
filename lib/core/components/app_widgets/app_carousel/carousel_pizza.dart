import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/app_widgets/app_carousel/widgets/carousel_controll_button.dart';
import 'package:pizza_app/core/utils/constants.dart';

import 'widgets/dots_with_controll.dart';

class AppCarousel extends StatefulWidget {
  final double carouselHeight;
  final List<String> photos;
  const AppCarousel({
    super.key,
    required this.carouselHeight,
    required this.photos,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int _index = 0;
  void onPageChanged(int val) {
    setState(() {
      _index = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          height: widget.carouselHeight,
          decoration: const BoxDecoration(
            color: MyColors.light,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) => onPageChanged(index),
              viewportFraction: 1.1,
              height: widget.carouselHeight,
            ),
            items: widget.photos.map((i) {
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
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CarouselControllButton(
                        buttonPosition: ButtonPosition.left,
                        onTap: () {},
                      ),
                      CarouselControllButton(
                        buttonPosition: ButtonPosition.right,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              DotsWithControll(
                activeIndex: _index,
                dotActiveColor: MyColors.orange,
                dotColor: MyColors.light,
                dotsCount: widget.photos.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
