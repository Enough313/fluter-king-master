import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  // yaha par ak model banaya jis me item name our us ka icon he

  String title;
  IconData image;

  Category({   this.title,    this.image});
}

List<Category> category_list = [
  Category(
    title: 'Accessories',
    image: FontAwesomeIcons.tshirt,
  ),
  Category(
    title: 'AutoMobile',
    image: FontAwesomeIcons.car,
  ),
  Category(
    title: 'Beauti and health',
    image: FontAwesomeIcons.hatCowboy,
  ),
  Category(
    title: 'Business and industory',
    image: FontAwesomeIcons.cashRegister,
  ),
  Category(
    title: 'Book and learninng',
    image: FontAwesomeIcons.book,
  ),
  Category(
    title: 'computer',
    image: FontAwesomeIcons.laptop,
  ),
  Category(
    title: 'electronic',
    image: FontAwesomeIcons.tv,
  ),
];
