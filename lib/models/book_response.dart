import 'package:two_books/models/book.dart';

class BookResponse {
  final List<Book> books;
  final String error;

  BookResponse({
    required this.books,
    required this.error,
  });

  BookResponse.fromJson(Map<String, dynamic> json)
      : books = (json['data'] as List).map((e) => Book.fromJson(e)).toList(),
        error = '';

  BookResponse.withError(String errorValue)
      : books = [],
        error = errorValue;
}
