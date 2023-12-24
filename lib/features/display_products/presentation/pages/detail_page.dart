import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });
  final String imageUrl;
  final String title;
  final double price;
  final String description;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text(
          category.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //--image
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //--title
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                textScaleFactor: 2,
              ),
              const SizedBox(height: 10),

              //--description
              Text(
                description,
                style: const TextStyle(
                  wordSpacing: 3,
                ),
              ),
              const SizedBox(height: 10),

              //--price
              Text(
                '₹ ${(price * 83).toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                textScaleFactor: 2,
              ),

              //--buynow
              Container(
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'BUY NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
