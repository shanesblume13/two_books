import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:two_books/models/api_response/book_response.dart';
import 'package:two_books/repository/api_repository.dart';

class GetBooksBloc {
  final ApiRepository _repository = ApiRepository();

  final BehaviorSubject<BooksResponse> _subject =
      BehaviorSubject<BooksResponse>();

  getBooks() async {
    BooksResponse response = await _repository.getBooks();
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = BooksResponse(books: [], error: '');
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<BooksResponse> get subject => _subject;
}

final getBooksBloc = GetBooksBloc();
