import 'package:two_books/models/book.dart';

class BookWithDetailsResponse {
  final Book? book;
  final String? error;

  BookWithDetailsResponse({
    this.book,
    required this.error,
  });

  BookWithDetailsResponse.fromJson(Map<String, dynamic> json)
      : book = json['data'] != null ? Book.fromJson(json['data']) : null,
        error = null;

  BookWithDetailsResponse.withError(String errorValue)
      : book = null,
        error = errorValue;
}
