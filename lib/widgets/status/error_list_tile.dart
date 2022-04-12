import 'package:flutter/material.dart';

class ErrorListTile extends StatelessWidget {
  final String? error;

  const ErrorListTile({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(error ?? 'Unknown Error'),
      ],
    );
  }
}
