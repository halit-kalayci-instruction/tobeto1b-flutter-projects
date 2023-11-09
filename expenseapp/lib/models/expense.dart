// id => identifier => kimlik belirleyici

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({required this.name, required this.price, required this.date})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
}

// int,long => 1,2,3,4,5,99999999

// String => 2c7cf20e-5dbb-41ad-a9d0-124635f347ef, d1b6ee05-73c0-4924-9ed7-f3b2e50ee0a9