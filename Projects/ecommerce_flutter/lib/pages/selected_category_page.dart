import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/blocs/products_bloc.dart';
import 'package:ecommerce_flutter/models/Product.dart';
import 'package:ecommerce_flutter/widgets/containers/CartButton/index.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/blocs/cart_bloc.dart';

class SelectedCategoryPage extends StatelessWidget {
  final List<Product> products;

  SelectedCategoryPage({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productBloc = BlocProvider.of<ProductsBloc>(context);
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[CartButton()],
        ),
        body: StreamBuilder<List<Product>>(
          stream: _productBloc.outProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = snapshot.data[index];
                  return InkWell(
                    onTap: () => _cartBloc.addProduct(product),
                    child: Center(
                      child: Text(product.name),
                    ),
                  );
                },
              );
            } else
              return SizedBox();
          },
        ));
  }
}
