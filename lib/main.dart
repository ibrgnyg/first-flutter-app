import 'package:e_comme_mob/convertmodels/product.dart';
import 'package:e_comme_mob/views/products/productsview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product>? products = [];
  Product product = Product();
  void _goProductPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductsViewPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(120),
              child: Center(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 15),
                      primary: Colors.deepOrange,
                    ),
                    onPressed: () {
                      _goProductPage();
                    },
                    child: const Text("Continue"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
