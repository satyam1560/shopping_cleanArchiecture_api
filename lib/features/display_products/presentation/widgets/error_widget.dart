import 'package:flutter/material.dart';

class FailedToLoad extends StatelessWidget {
  const FailedToLoad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text('Something went wrong'),
        ],
      ),
    );
  }
}
