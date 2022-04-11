import 'package:two_books/models/author.dart';

class Book {
  final String id;
  final String title;
  final Author author;

  Book({
    required this.id,
    required this.title,
    required this.author,
  });

  // TODO Figure out if we want to use a factory or not
  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        author = Author.fromJson(json['author']);
}
