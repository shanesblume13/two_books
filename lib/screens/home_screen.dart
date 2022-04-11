import 'package:flutter/material.dart';
import 'package:two_books/screens/books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
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
    );
  }
}
