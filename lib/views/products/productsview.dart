import 'package:e_comme_mob/main.dart';
import 'package:e_comme_mob/views/components/commoncompenent.dart';
import 'package:e_comme_mob/views/shared/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsViewPage extends StatelessWidget {
  const ProductsViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(true, const MyApp()),
      body: const CommonComp(),
    );
  }
}
