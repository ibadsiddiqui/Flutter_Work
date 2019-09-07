import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/blocs/cart_bloc.dart';
import 'package:ecommerce_flutter/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CartPage()));
          },
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: StreamBuilder<int>(
              stream: _cartBloc.outCount,
              initialData: 0,
              builder: (context, snapshot) => Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
