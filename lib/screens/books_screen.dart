import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_books_bloc.dart';
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
            itemCount: snapshot.data!.books.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.books[index].title),
                subtitle: Text(
                  'by ${snapshot.data!.books[index].author.name}',
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
}
