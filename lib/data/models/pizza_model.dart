final pizzas = [
  Pizza(
    id: '1',
    img: 'assets/img/pizza/Margherita.png',
    photos: [
      'assets/img/pizza/Margherita_2.jpg',
      'assets/img/pizza/Margherita.jpg'
    ],
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
    photos: [],
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
    photos: [],
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
    photos: [],
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
    photos: [],
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
    photos: [],
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
  final List<String> photos;
  final String description;
  final bool isSpicy;
  final bool isVegan;
  final double price;
  final double? oldPrice;

  Pizza({
    required this.id,
    required this.title,
    required this.img,
    required this.photos,
    required this.description,
    this.isSpicy = false,
    this.isVegan = false,
    required this.price,
    this.oldPrice,
  });
}
