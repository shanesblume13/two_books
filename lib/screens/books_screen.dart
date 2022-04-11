import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_books_bloc.dart';
import 'package:two_books/bloc/show_scroll_to_top_bloc.dart';
import 'package:two_books/models/book.dart';
import 'package:two_books/models/book_response.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    getBooksBloc.getBooks();
  }

  // TODO Do we really need to dispose and drain here?
  @override
  void dispose() {
    getBooksBloc.drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookResponse>(
      stream: getBooksBloc.subject.stream,
      builder: (context, AsyncSnapshot<BookResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error != '') {
            return Text(snapshot.data!.error);
          }
          return ListView.builder(
            controller: showScrollToTopBloc.scrollController,
            itemCount: snapshot.data!.books.length,
            itemBuilder: (context, index) {
              Book book = snapshot.data!.books[index];

              return Hero(
                tag: book.id,
                transitionOnUserGestures: true,
                child: Material(
                  child: ListTile(
                    onTap: () => _goToBookDetailsPage(context, book),
                    leading: CircleAvatar(
                      backgroundColor: book.color,
                      child: const Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(book.title),
                    subtitle: Text(
                      'by ${book.author.name}',
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _goToBookDetailsPage(BuildContext context, Book book) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Book Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: book.id,
              transitionOnUserGestures: true,
              child: Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: book.color,
                    child: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(book.title),
                  subtitle: Text(
                    'by ${book.author.name}',
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: Text('Reviews'),
                subtitle: Text('${book.reviews.length} reviews'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
