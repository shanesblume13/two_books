import 'package:flutter/material.dart';
import 'package:two_books/bloc/get_book_with_details_bloc.dart';
import 'package:two_books/models/book/book.dart';
import 'package:two_books/models/book/book_with_details_response.dart';
import 'package:two_books/widgets/book_details_card.dart';
import 'package:two_books/widgets/book_summary_card.dart';
import 'package:two_books/widgets/my_app_bar.dart';
import 'package:two_books/widgets/error_list_tile.dart';
import 'package:two_books/widgets/no_results_list_tile.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  const BookDetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    // Although we pass a book in, we use the bloc to get additional details
    // with a fresh api call. This also allows us to refresh the details on pull
    // without loading all the books again.
    getBookWithDetailsBloc.getBookWithDetails(widget.book.id);

    super.initState();
  }

  @override
  void dispose() {
    getBookWithDetailsBloc.drainStream();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    await getBookWithDetailsBloc.getBookWithDetails(widget.book.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: MyAppBar(title: 'Book Details'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BookSummaryCard(
              book: widget.book,
              isExpanded: true,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: StreamBuilder<BookWithDetailsResponse>(
                  stream: getBookWithDetailsBloc.subject.stream,
                  builder: (context,
                      AsyncSnapshot<BookWithDetailsResponse> snapshot) {
                    if (snapshot.hasData) {
                      BookWithDetailsResponse bookWithDetailsResponse =
                          snapshot.data!;

                      // Handle response errors
                      if (bookWithDetailsResponse.error != null) {
                        return ErrorListTile(
                            error: bookWithDetailsResponse.error);
                      }
                      // Handle a successful but empty response
                      if (bookWithDetailsResponse.book == null) {
                        return const NoResultsListTile();
                      }

                      return BookDetailsCard(
                          book: bookWithDetailsResponse.book!);
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
