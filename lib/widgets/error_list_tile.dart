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
        SizedBox(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.errorContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                // Show detailed error message in future
                'Something went wrong!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.errorContainer),
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
