import 'package:e_comme_mob/convertmodels/product.dart';
import 'package:e_comme_mob/services/productsservies.dart';
import 'package:e_comme_mob/views/shared/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'productsview.dart';

class ProductViewDetailPage extends StatefulWidget {
  final int? pid;
  const ProductViewDetailPage({Key? key, this.pid}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductViewDetailPage> {
  late Product product = Product();
  bool loading = true;
  final ProductsService _productService = ProductsService();
  @override
  void initState() {
    _productService.getProduct(widget.pid!).then((value) {
      setState(() {
        product = value;
        loading = false;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
          appBar: builderAppBar(false, const ProductsViewPage()),
          body: Center(
              child: LoadingFlipping.circle(
            borderColor: Colors.cyan,
            borderSize: 3.0,
            size: 30.0,
            backgroundColor: Colors.cyanAccent,
            duration: const Duration(milliseconds: 500),
          )));
    } else {
      return Scaffold(
          appBar: builderAppBar(false, const ProductsViewPage()),
          body: productDetail());
    }
  }

  SingleChildScrollView productDetail() {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 400,
              child: Container(
                padding: const EdgeInsets.all(18.0),
                width: 160,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black),
                ),
                child: Image.network(product.image!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(product.title!, style: const TextStyle(fontSize: 19)),
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                product.description!,
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              child: Column(children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "\$${product.price ?? '0'}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                      SizedBox(
                        width: 130.0,
                        height: 55.0,
                        child: ElevatedButton(
                            child: const Text('Add to basket'),
                            onPressed: () => {}),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
