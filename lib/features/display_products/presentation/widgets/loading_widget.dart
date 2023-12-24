import 'package:flutter/material.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue[100],
        color: Colors.black,
      ),
    );
  }
}
