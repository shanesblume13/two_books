import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ScrollToTopBloc {
  // This will show/hide a FAB to scroll to the top of the list
  final BehaviorSubject<bool> _showFABSubject = BehaviorSubject<bool>();
  Function(bool) get changeShowFAB => _showFABSubject.sink.add;
  bool get showFAB => _showFABSubject.valueOrNull ?? false;

  // The scroll controller subject is shared between screens
  final BehaviorSubject<ScrollController> _scrollControllerSubject =
      BehaviorSubject<ScrollController>();
  Function(ScrollController) get changeScrollController =>
      _scrollControllerSubject.sink.add;
  ScrollController get scrollController =>
      _scrollControllerSubject.valueOrNull ?? ScrollController();

  // Listen to the scroll position of the list and show/hide the FAB
  void setupScrollListener(ScrollController scrollController) {
    changeScrollController(scrollController);

    scrollController.addListener(
      () {
        if (scrollController.offset >= 400) {
          changeShowFAB(true);
        } else {
          changeShowFAB(false);
        }
      },
    );
  }

  // Scroll page to top w/ shared scroll controller
  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }

  void drainStream() {
    _showFABSubject.value = false;
    _scrollControllerSubject.value = ScrollController();
  }

  void dispose() async {
    await _showFABSubject.drain();
    await _scrollControllerSubject.drain();
    _showFABSubject.close();
    _scrollControllerSubject.close();
  }

  BehaviorSubject<bool> get showFABSubject => _showFABSubject;
  BehaviorSubject<ScrollController> get scrollControllerSubject =>
      _scrollControllerSubject;
}

final scrollToTopBloc = ScrollToTopBloc();
