import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:two_books/models/book_response.dart';
import 'package:two_books/repository/api_repository.dart';

class GetBooksBloc {
  final ApiRepository _repository = ApiRepository();

  final BehaviorSubject<BookResponse> _subject =
      BehaviorSubject<BookResponse>();

  // TODO Add filtering
  getBooks() async {
    BookResponse response = await _repository.getBooks();
    _subject.sink.add(response);
  }

  // TODO looks into drainStream standards for nullabitlity
  void drainStream() {
    _subject.value = BookResponse(books: [], error: '');
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<BookResponse> get subject => _subject;
}

final getBooksBloc = GetBooksBloc();
