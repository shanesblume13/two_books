import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_books_bloc.dart';
import 'package:two_books/bloc/scroll_to_top_bloc.dart';
import 'package:two_books/models/api_response/book_response.dart';
import 'package:two_books/models/book.dart';
import 'package:two_books/screens/book_details_screen.dart';
import 'package:two_books/widgets/book/book_summary_card.dart';
import 'package:two_books/widgets/status/error_list_tile.dart';
import 'package:two_books/widgets/my_app_bar.dart';
import 'package:two_books/widgets/status/no_results_list_tile.dart';
import 'package:two_books/widgets/scroll_to_top_fab.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  initState() {
    scrollToTopBloc.setupScrollListener(ScrollController());
    getBooksBloc.getBooks();

    super.initState();
  }

  @override
  void dispose() {
    scrollToTopBloc.drainStream();
    getBooksBloc.drainStream();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    await getBooksBloc.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: MyAppBar(title: 'Two Book'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: StreamBuilder<BooksResponse>(
            stream: getBooksBloc.subject.stream,
            builder: (context, AsyncSnapshot<BooksResponse> snapshot) {
              if (snapshot.hasData) {
                BooksResponse booksResponse = snapshot.data!;

                // Handle response errors
                if (booksResponse.error != null) {
                  return ErrorListTile(error: booksResponse.error);
                }

                // Handle a successful but empty response
                if (booksResponse.books.isEmpty) {
                  return const NoResultsListTile();
                }

                // Handle a successful response
                return buildBooksListView(booksResponse.books);
              }

              // Loading state
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      floatingActionButton: const ScrollToTopFAB(),
    );
  }

  // Build a list of book list tiles from a list of books
  ListView buildBooksListView(List<Book> books) {
    return ListView.builder(
      controller: scrollToTopBloc.scrollController,
      itemCount: books.length,
      itemBuilder: (context, index) {
        Book book = books[index];

        // Hero used for smooth transition between screens
        return BookSummaryCard(
          book: book,
          isExpanded: false,
          onTap: () => _goToBookDetailsPage(context, book),
        );
      },
    );
  }

  // Navigation could be more robust, but this does the job
  // in a 2 page application.
  void _goToBookDetailsPage(BuildContext context, Book book) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => BookDetailsScreen(book: book),
      ),
    );
  }
}
