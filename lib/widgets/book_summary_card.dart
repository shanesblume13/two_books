import 'package:flutter/material.dart';
import 'package:two_books/models/book/book.dart';

// This card has two states, expanded and not expanded.
// Expanded is used as a header on the book details page.
// Not exapnded is used as a card on the books list page.
// This allows the hero to animate a "growing" card
class BookSummaryCard extends StatelessWidget {
  final Book book;
  final bool isExpanded;
  final Function? onTap;

  const BookSummaryCard({
    Key? key,
    required this.book,
    required this.isExpanded,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // These should all be put into their own object or a base class
    double _vericalPadding = isExpanded ? 12.0 : 0.0;
    double _avatarSize = isExpanded ? 30.0 : 20.0;
    TextStyle? _titleTextStyle = isExpanded
        ? Theme.of(context).textTheme.titleLarge
        : Theme.of(context).textTheme.titleMedium;
    TextStyle? _authorTextStyle = isExpanded
        ? Theme.of(context).textTheme.subtitle1
        : Theme.of(context).textTheme.subtitle2;

    return Hero(
      tag: book.id,
      transitionOnUserGestures: true,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: _vericalPadding),
          child: ListTile(
            // This process allows the summary card on the deetail page to be
            // tapped for a splash effect, with no action. Splash should be removed.
            onTap: () => onTap?.call(),
            leading: CircleAvatar(
              radius: _avatarSize,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.book,
                color: Colors.white,
                size: _avatarSize,
              ),
            ),
            title: Text(
              book.title,
              style: _titleTextStyle,
            ),
            subtitle: Text(
              'by ${book.author?.name ?? 'Unknown Author'}',
              style: _authorTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
