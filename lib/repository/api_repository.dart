import 'package:dio/dio.dart';
import 'package:two_books/models/book_response.dart';

class ApiRepository {
  final Dio _dio = Dio();

  static String baseUrl = 'https://thomaxxl.pythonanywhere.com/api';

  // Urls for the different endpoints
  String getBooksUrl = '$baseUrl/Books/';

  // TODO add parameters for filtering
  Future<BookResponse> getBooks() async {
    Map<String, dynamic> params = {};

    try {
      final Response response =
          await _dio.get(getBooksUrl, queryParameters: params);
      return BookResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      // TODO remove print from production code.
      print('Exception: $error \n stacktrace: $stacktrace');
      return BookResponse.withError('Error getting books. \n $error');
    }
  }
}
