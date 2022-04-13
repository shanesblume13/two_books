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
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[100]!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                // Show detailed error message in future
                'No Results Found',
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
