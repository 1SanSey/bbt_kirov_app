import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BookModel extends BookEntity {
  const BookModel(
      {required name,
      required price,
      required isPopular,
      required image,
      required description,
      required size,
      required singleOrSet,
      quantity})
      : super(
            name: name,
            price: price,
            isPopular: isPopular,
            image: image,
            description: description,
            size: size,
            singleOrSet: singleOrSet);

  factory BookModel.fromDb(ParseObject object) {
    return BookModel(
      name: object.get<String>('name'),
      price: object.get<int>('price'),
      isPopular: object.get<bool>('isPopular'),
      image: object.get<String>('image') ?? '',
      description: object.get<String>('description') ?? '',
      size: object.get<String>('size') ?? '',
      singleOrSet: object.get<String>('singleOrSet') ?? '',
      quantity: object.get<int>('quantity'),
    );
  }
}
