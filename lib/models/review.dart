import 'package:two_books/models/person.dart';

class Review {
  final String id;
  final String review;
  final Person? reader;

  Review({
    required this.id,
    required this.review,
    this.reader,
  });

  Review.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        review = json['review'] ?? 'No review',
        reader =
            json['reader'] != null ? Person.fromJson(json['reader']) : null;
}
