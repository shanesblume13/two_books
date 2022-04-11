import 'package:flutter/material.dart';
import 'package:two_books/bloc/show_scroll_to_top_bloc.dart';
import 'package:two_books/screens/books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    showScrollToTopBloc.changeScrollController(_scrollController);
    _scrollController = showScrollToTopBloc.scrollController
      ..addListener(() {
        if (_scrollController.offset >= 400) {
          showScrollToTopBloc.changeShowScrollToTop(true);
        } else {
          showScrollToTopBloc.changeShowScrollToTop(false);
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Books',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: BooksScreen(),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: showScrollToTopBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            );
          }
          return Container();
        },
      ),
    );
  }
}
