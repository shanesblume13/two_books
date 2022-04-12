import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_all_books_bloc.dart';
import 'package:two_books/bloc/show_scroll_to_top_bloc.dart';
import 'package:two_books/models/book.dart';
import 'package:two_books/models/book_response.dart';
import 'package:two_books/screens/book_details_screen.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    getAllBooksBloc.getAllBooks();
  }

  // TODO Do we really need to dispose and drain here?
  @override
  void dispose() {
    getAllBooksBloc.drainStream();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    getAllBooksBloc.getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookResponse>(
      stream: getAllBooksBloc.subject.stream,
      builder: (context, AsyncSnapshot<BookResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error != '') {
            return RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView(
                children: [
                  Text(snapshot.data!.error),
                ],
              ),
            );
          }
          if (snapshot.data!.books.isEmpty) {
            return RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView(
                children: const [
                  Text('No results'),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => _handleRefresh(),
            child: ListView.builder(
              controller: showScrollToTopBloc.scrollController,
              itemCount: snapshot.data!.books.length,
              itemBuilder: (context, index) {
                Book book = snapshot.data!.books[index];

                return Hero(
                  tag: book.id,
                  transitionOnUserGestures: true,
                  child: Card(
                    child: ListTile(
                      onTap: () => _goToBookDetailsPage(context, book),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: book.color,
                        child: const Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 20,
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
            ),
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
      builder: (BuildContext context) => BookDetailsScreen(book: book),
    ));
  }
}
