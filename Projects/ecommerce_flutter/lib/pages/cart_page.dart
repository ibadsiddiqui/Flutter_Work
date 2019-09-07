import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/blocs/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: StreamBuilder(
        stream: _cartBloc.outCount,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.data.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final product = snapshot.data[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: Text(product.amount.toString()),
                );
              },
            );
          } else {
            return Center(
                child: Text(
              "No items in the cart",
              style: TextStyle(fontSize: 22),
            ));
          }
        },
      ),
    );
  }
}
