import 'package:badges/badges.dart';
import 'package:e_comme_mob/services/categoryservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesComp extends StatefulWidget {
  const CategoriesComp({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesComp> {
  List<String> categories = [];
  @override
  void initState() {
    CategoryService _categoryService = CategoryService();
    _categoryService.getCategories().then((value) {
      setState(() {
        categories = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _builderCategories(index)),
    );
  }

  Widget _builderCategories(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Badge(
                toAnimate: false,
                shape: BadgeShape.square,
                badgeColor: Colors.grey[350]!,
                borderRadius: BorderRadius.circular(8),
                badgeContent: Text(categories[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1 / 4),
                height: 2,
                width: 30,
              )
            ],
          ),
        ),
      );
}
