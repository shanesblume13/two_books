import 'package:flutter/material.dart';

class NoResultsListTile extends StatelessWidget {
  const NoResultsListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text('No results'),
      ],
    );
  }
}
