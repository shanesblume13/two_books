import 'package:flutter/material.dart';

class ScrollToTopFAB extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopFAB({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ScrollToTopFAB> createState() => _ScrollToTopFABState();
}

class _ScrollToTopFABState extends State<ScrollToTopFAB> {
  bool showFAB = false;

  iinitState() {
    super.initState();
  }

  // Scroll page to top w/ shared scroll controller
  void scrollToTop() {
    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(
      () {
        if (widget.scrollController.offset >= 400) {
          setState(() {
            showFAB = true;
          });
        } else {
          setState(() {
            showFAB = false;
          });
        }
      },
    );

    return showFAB == true
        ? FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () => scrollToTop(),
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          )
        : Container();
  }
}
