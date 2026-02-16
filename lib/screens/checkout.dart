import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/main_drawer.dart';
import 'package:panucci_ristorante/components/order_item.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  final List items = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16.0),
        child: CustomScrollView(
          // The Text here must wrapped by a SliverToBoxAdapter in order to avoid the error: "A RenderViewport expected a child of type RenderSliver but received a child of type RenderErrorBox."
          slivers: <Widget>[
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Pedido',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            )),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return OrderItem(
                    imageURI: items[index]['image'],
                    itemTitle: items[index]['name'],
                    itemPrice: items[index]['price']);
              },
              childCount: items.length,
            ))
          ],
        ),
      ),
    );
  }
}
