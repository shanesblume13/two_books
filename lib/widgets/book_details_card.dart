import 'package:flutter/material.dart';
import 'package:two_books/models/book/book.dart';
import 'package:two_books/models/review.dart';

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.business),
            title: Text('Published by ${book.publisher?.name ?? 'Unknown'}'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Being read by ${book.reader?.name ?? 'no one'}'),
          ),
          ExpansionTile(
            leading: const Icon(Icons.star),
            title: Text('Reviews (${book.reviews.length})'),
            children: [
              for (Review review in book.reviews)
                ListTile(
                  title: Text(
                    review.review,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    review.reader?.name ?? 'Unknown',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
