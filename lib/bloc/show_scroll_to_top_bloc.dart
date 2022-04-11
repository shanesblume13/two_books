import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ShowScrollToTopBloc {
  final BehaviorSubject<bool> _subject = BehaviorSubject<bool>();
  Function(bool) get changeShowScrollToTop => _subject.sink.add;
  bool get showScrollToTop => _subject.valueOrNull ?? false;

  final BehaviorSubject<ScrollController> _controllerSubject =
      BehaviorSubject<ScrollController>();
  Function(ScrollController) get changeScrollController =>
      _controllerSubject.sink.add;
  ScrollController get scrollController =>
      _controllerSubject.valueOrNull ?? ScrollController();

  void dispose() async {
    await _subject.drain();
    await _controllerSubject.drain();
    _subject.close();
    _controllerSubject.close();
  }

  BehaviorSubject<bool> get subject => _subject;
  BehaviorSubject<ScrollController> get controllerSubject => _controllerSubject;
}

final showScrollToTopBloc = ShowScrollToTopBloc();
