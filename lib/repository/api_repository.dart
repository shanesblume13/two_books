import 'package:dio/dio.dart';
import 'package:japx/japx.dart';
import 'package:two_books/models/book/book_response.dart';
import 'package:two_books/models/book/book_with_details_response.dart';

class ApiRepository {
  final Dio _dio = Dio();
  static String booksBaseUrl = 'https://thomaxxl.pythonanywhere.com/api/Books';

  Future<BooksResponse> getBooks() async {
    // Include the author relationship so we can flatten in and display it on
    // the books screen. The remaining details will be saved for the book detail screen.
    Map<String, dynamic> params = {
      'include': 'author',
      //'filter[title]': 'book_title0',
      // 'filter': '[{"name":"title","op":"eq","val":"book_title0"}]',
    };

    try {
      final Response response =
          await _dio.get(booksBaseUrl, queryParameters: params);

      // Jpax will flatten the relationships for us for easier decoding.
      return BooksResponse.fromJson(Japx.decode(response.data));
    } catch (error) {
      // We could include the stacktrace in the future for debugging.
      return BooksResponse.withError('Error getting books. \n $error');
    }
  }

  Future<BookWithDetailsResponse> getBookWithDetails(String bookId) async {
    String getBookWithDetailsUrl = '$booksBaseUrl/$bookId';

    // Include additional relationship so we can flatten in and display the on
    // the book details screen.
    Map<String, dynamic> params = {
      'include': 'publisher,author,reader,reviews,reviews.reader',
    };

    try {
      final Response response =
          await _dio.get(getBookWithDetailsUrl, queryParameters: params);

      // Jpax will flatten the relationships for us for easier decoding.
      return BookWithDetailsResponse.fromJson(Japx.decode(response.data));
    } catch (error) {
      // We could include the stacktrace in the future for debugging.
      return BookWithDetailsResponse.withError(
          'Error getting book details. \n $error');
    }
  }
}
