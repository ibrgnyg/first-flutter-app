import 'package:e_comme_mob/convertmodels/product.dart';
import 'package:e_comme_mob/services/productsservies.dart';
import 'package:e_comme_mob/views/components/categorycompenent.dart';
import 'package:e_comme_mob/views/products/productviewdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animations/loading_animations.dart';

class CommonComp extends StatefulWidget {
  const CommonComp({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<CommonComp> {
  List<Product> products = [];
  final ProductsService _productService = ProductsService();
  @override
  void initState() {
    _productService.getProducts().then((value) {
      setState(() {
        products = value;
      });
    });
    super.initState();
  }

  void _goDetailProduct(int? pid) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductViewDetailPage(pid: pid)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (products.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Day Deals",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              child: const CategoriesComp(),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              )),
          Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height - 189),
                  ),
                  itemBuilder: (context, index) => builderProducts(index)))
        ],
      );
    } else {
      return Center(
          child: LoadingFlipping.circle(
        borderColor: Colors.cyan,
        borderSize: 3.0,
        size: 30.0,
        backgroundColor: Colors.cyanAccent,
        duration: const Duration(milliseconds: 500),
      ));
    }
  }

  Widget builderProducts(int index) => InkWell(
      onTap: () {
        _goDetailProduct(products[index].id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(18.0),
              width: 160,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black),
              ),
              child: Image.network(products[index].image!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.4),
              child: Text(products[index].title!.substring(1, 17) + "..."),
            ),
            Text(
              "\$${products[index].price ?? '0'}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ));
}
