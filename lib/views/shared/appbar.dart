import 'package:badges/badges.dart';
import 'package:e_comme_mob/services/basket.dart';
import 'package:flutter/material.dart';

AppBar builderAppBar(bool showInput, dynamic routerParam) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: BackWidget(route: routerParam),
    actions: <Widget>[
      if (showInput)
        IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.search)),
      Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        badgeContent: Text(
          AddBasketCount.count.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: const Icon(Icons.shopping_cart),
        ),
      )
    ],
  );
}

class BackWidget extends StatelessWidget {
  final dynamic route;
  const BackWidget({
    Key? key,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.black,
      icon: const Icon(Icons.keyboard_backspace),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
    );
  }
}
