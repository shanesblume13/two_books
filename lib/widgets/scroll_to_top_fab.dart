import 'package:flutter/material.dart';
import 'package:two_books/bloc/scroll_to_top_bloc.dart';

class ScrollToTopFAB extends StatelessWidget {
  const ScrollToTopFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: scrollToTopBloc.showFABSubject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return FloatingActionButton(
            onPressed: () => scrollToTopBloc.scrollToTop(),
            child: const Icon(Icons.arrow_upward),
          );
        }
        return Container();
      },
    );
  }
}
