import 'package:bbt_kirov_app/features/bbt/domain/entities/book_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BookModel extends BookEntity {
  const BookModel(
      {required name,
      required price,
      required image,
      required description,
      required size,
      required singleOrSet})
      : super(
            name: name,
            price: price,
            image: image,
            description: description,
            size: size,
            singleOrSet: singleOrSet);

  factory BookModel.fromDb(ParseObject object) {
    return BookModel(
      name: object.get<String>('name'),
      price: object.get<String>('price'),
      image: object.get<String>('image'),
      description: object.get<String>('description'),
      size: object.get<String>('size'),
      singleOrSet: object.get<String>('singleOrSet'),
    );
  }
}
