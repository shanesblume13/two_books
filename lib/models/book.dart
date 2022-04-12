import 'package:two_books/models/publisher.dart';
import 'package:two_books/models/person.dart';
import 'package:two_books/models/review.dart';

class Book {
  final String id;
  final String title;
  final Person? author;
  final Publisher? publisher;
  final List<Review> reviews;
  final Person? reader;

  Book({
    required this.id,
    required this.title,
    this.author,
    this.publisher,
    required this.reviews,
    this.reader,
  });

  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] ?? 'Untitled',
        author =
            json['author'] != null ? Person.fromJson(json['author']) : null,
        publisher = json['publisher'] != null
            ? Publisher.fromJson(json['publisher'])
            : null,
        reviews = json['reviews'] != null
            ? (json['reviews'] as List<dynamic>)
                .map((review) => Review.fromJson(review))
                .toList()
            : [],
        reader =
            json['reader'] != null ? Person.fromJson(json['reader']) : null;
}
