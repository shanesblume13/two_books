import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:two_books/models/book/book_with_details_response.dart';
import 'package:two_books/repository/api_repository.dart';

class GetBookWithDetailsBloc {
  final ApiRepository _repository = ApiRepository();

  final BehaviorSubject<BookWithDetailsResponse> _subject =
      BehaviorSubject<BookWithDetailsResponse>();

  getBookWithDetails(String bookId) async {
    BookWithDetailsResponse response =
        await _repository.getBookWithDetails(bookId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = BookWithDetailsResponse(book: null, error: null);
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<BookWithDetailsResponse> get subject => _subject;
}

final getBookWithDetailsBloc = GetBookWithDetailsBloc();
