import 'package:flutter/material.dart';

import 'features/display_products/presentation/pages/product_display_screen.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.productInstanceInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Api',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProductDisplayScreen(),
    );
  }
}
