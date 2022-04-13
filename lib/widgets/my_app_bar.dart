import 'package:flutter/material.dart';
import 'package:two_books/widgets/info_icon_button.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: const [
        InfoIconButton(),
      ],
    );
  }
}
