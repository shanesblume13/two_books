import 'package:flutter/material.dart';
import 'package:two_books/screens/books_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two Books',
      theme: ThemeData(
        // Using custom colors in a few places, but should set up a full theme
        // in the future.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BooksScreen(),
    );
  }
}
