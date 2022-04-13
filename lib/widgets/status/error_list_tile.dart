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
            color: Colors.red[50],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.red[100]!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                // Show detailed error message in future
                'Something went wrong!',
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
