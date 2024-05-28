import 'package:flutter/material.dart';

class DotsWithControll extends StatefulWidget {
  final int activeIndex;
  final double dotWidth;
  final double dotHeight;
  final Color dotColor;
  final double dotSpacing;
  final Color dotActiveColor;
  final int dotsCount;
  final EdgeInsetsGeometry padding;
  final bool isShownConroll;

  const DotsWithControll({
    super.key,
    required this.activeIndex,
    this.dotWidth = 10,
    this.dotHeight = 10,
    required this.dotColor,
    this.dotSpacing = 10,
    required this.dotActiveColor,
    required this.dotsCount,
    this.padding = EdgeInsets.zero,
    this.isShownConroll = true,
  });

  @override
  State<DotsWithControll> createState() => _DotsWithControllState();
}

class _DotsWithControllState extends State<DotsWithControll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        spacing: widget.dotSpacing,
        children: _Dot.createDots(
          amount: widget.dotsCount,
          activeIndex: widget.activeIndex,
          activeColor: widget.dotActiveColor,
          color: widget.dotColor,
          width: widget.dotWidth,
          height: widget.dotHeight,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const _Dot({
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(width * 2),
        ),
      ),
    );
  }

  static List<_Dot> createDots({
    required int amount,
    required int activeIndex,
    required Color activeColor,
    required Color color,
    double width = 10,
    double height = 10,
  }) {
    return [
      for (var i = 0; i < amount; i++)
        _Dot(
          color: i == activeIndex ? activeColor : color,
          width: i == activeIndex ? width * 2 + 10 : width,
          height: height,
        ),
    ];
  }
}
