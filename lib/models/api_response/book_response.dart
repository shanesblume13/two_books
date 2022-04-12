import 'package:two_books/models/book.dart';

class BooksResponse {
  final List<Book> books;
  final String? error;

  BooksResponse({
    required this.books,
    required this.error,
  });

  BooksResponse.fromJson(Map<String, dynamic> json)
      : books = (json['data'] as List).map((e) => Book.fromJson(e)).toList(),
        error = null;

  BooksResponse.withError(String errorValue)
      : books = [],
        error = errorValue;
}
