import 'package:flutter/material.dart';

class NoResultsListTile extends StatelessWidget {
  const NoResultsListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                // Show detailed error message in future
                'No reults found.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiaryContainer),
                //error ?? 'Something went wrong',
              ),
            ),
          ),
        )
        // Card(
        //   child: Text(error ?? 'Unknown Error'),
        // ),
      ],
    );
  }
}
