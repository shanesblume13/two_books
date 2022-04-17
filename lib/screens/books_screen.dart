import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_books_bloc.dart';
import 'package:two_books/models/book/book.dart';
import 'package:two_books/models/book/book_response.dart';
import 'package:two_books/screens/book_details_screen.dart';
import 'package:two_books/widgets/book_summary_card.dart';
import 'package:two_books/widgets/error_list_tile.dart';
import 'package:two_books/widgets/my_app_bar.dart';
import 'package:two_books/widgets/no_results_list_tile.dart';
import 'package:two_books/widgets/scroll_to_top_fab.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  final ScrollController scrollController = ScrollController();

  @override
  initState() {
    getBooksBloc.getBooks();

    super.initState();
  }

  @override
  void dispose() {
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
        child: MyAppBar(title: 'Two Books'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildSearchTextInput(),
            Expanded(
              child: Card(
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
            ),
          ],
        ),
      ),
      floatingActionButton: ScrollToTopFAB(
        scrollController: scrollController,
      ),
    );
  }

  Padding buildSearchTextInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              _searchController.clear();
              setState(() {
                searchText = '';
              });
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  ListView buildBooksListView(List<Book> books) {
    // Use search text to filter books before building list
    if (searchText.isNotEmpty) {
      books = books.where((book) => bookMatchesSearchText(book)).toList();
    }

    return ListView.builder(
      controller: scrollController,
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

  // We could add readers and publishers to the search match, but since those
  // fields aren't displated on this page it would take a little more design
  // thought to communicate to the user why books are matching on those fields.
  bool bookMatchesSearchText(Book book) =>
      book.title.toLowerCase().contains(searchText.toLowerCase()) ||
      (book.author?.name.toLowerCase().contains(searchText.toLowerCase()) ??
          false);

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
