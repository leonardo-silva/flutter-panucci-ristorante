import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});
  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Bebidas',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return DrinkItem(
                      imageURI: items[index]['image'],
                      itemTitle: items[index]['name'],
                      itemPrice: items[index]['price']);
                },
                childCount: items.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2))
        ],
      ),
    );
    // return GridView.builder(
    //   gridDelegate:
    //       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //   itemBuilder: (context, index) {
    //     return DrinkItem(
    //         imageURI: items[index]['image'],
    //         itemTitle: items[index]['name'],
    //         itemPrice: items[index]['price']);
    //   },
    //   itemCount: items.length,
    // );
  }
}
