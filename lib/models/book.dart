import 'dart:math';
import 'package:flutter/material.dart';
import 'package:two_books/models/author.dart';
import 'package:two_books/models/reader.dart';
import 'package:two_books/models/review.dart';

class Book {
  final String id;
  final String title;
  final Author author;
  final List<Review> reviews;
  final List<Reader> readers;
  final Color color;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.reviews,
    required this.readers,
    required this.color,
  });

  // TODO Figure out if we want to use a factory or not
  Book.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        author = Author.fromJson(json['author']),
        reviews = json['reviews'] != null
            ? (json['reviews'] as List<dynamic>)
                .map((review) => Review.fromJson(review))
                .toList()
            : [],
        readers = json['readers'] != null
            ? (json['readers'] as List<dynamic>)
                .map((reader) => Reader.fromJson(reader))
                .toList()
            : [],
        color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
