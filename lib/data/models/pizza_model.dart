import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final pizzas = [
  Pizza(
    id: '1',
    img: 'assets/img/pizza/Margherita.png',
    title: 'Margherita',
    description: 'Tomato sauce, Mozzarella, Olive oil, Basil leaves',
    isSpicy: true,
    isVegan: false,
    price: 10.00,
    oldPrice: 12.20,
  ),
  Pizza(
    id: '2',
    img: 'assets/img/pizza/Mari_e_monte.png',
    title: 'Mari e monte',
    description: 'Tomatoes, Frutti di mare, Champignons, Garlic, Onion',
    isSpicy: false,
    isVegan: false,
    price: 8.00,
    oldPrice: 11.20,
  ),
  Pizza(
    id: '3',
    img: 'assets/img/pizza/Marinara.png',
    title: 'Marinara',
    description: 'Marinara sauce, Garlic, Olive oil, Basil, Oregano',
    isSpicy: true,
    isVegan: true,
    price: 8.00,
    oldPrice: 11.20,
  ),
  Pizza(
    id: '4',
    img: 'assets/img/pizza/Mazza.png',
    title: 'Mazza',
    description: 'Tomato sauce, Mozzarella, Bacon, Eggs, Onions, Chili pepper',
    isSpicy: true,
    isVegan: false,
    price: 8.00,
    oldPrice: 11.20,
  ),
  Pizza(
    id: '5',
    img: 'assets/img/pizza/Napoli.png',
    title: 'Napoli',
    description: 'Tomato sauce, Mozzarella, Capers, Anchovies, Olive oil',
    isSpicy: false,
    isVegan: true,
    price: 8.60,
    oldPrice: 11.60,
  ),
  Pizza(
    id: '5',
    img: 'assets/img/pizza/Peperoni.png',
    title: 'Peperoni',
    description: 'Tomato sauce, Mozzarella, Chili peppers',
    isSpicy: true,
    isVegan: false,
    price: 9.20,
    oldPrice: 12.60,
  ),
];

class Pizza {
  final String id;
  final String title;
  final String img;
  final String description;
  final bool isSpicy;
  final bool isVegan;
  final double price;
  final double? oldPrice;

  Pizza({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    this.isSpicy = false,
    this.isVegan = false,
    required this.price,
    this.oldPrice,
  });
}
