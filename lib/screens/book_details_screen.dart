import 'package:flutter/material.dart';
import 'package:two_books/models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: book.id,
            transitionOnUserGestures: true,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: book.color,
                    child: const Icon(
                      Icons.book,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    book.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    'by ${book.author.name}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.business),
                  title: Text('Published by ${book.publisher.name}'),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('${book.readers.length} readers'),
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: Text('${book.reviews.length} reviews'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
