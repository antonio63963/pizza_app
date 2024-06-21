import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String? img;
  const CardImage({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        height: 150,
        child: img != null
            ? Image.asset(
                img!,
                fit: BoxFit.contain,
              )
            : const Text(
                'No Picture, sorry...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}
