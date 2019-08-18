import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/blocs/products_bloc.dart';
import 'package:ecommerce_flutter/models/Product.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  final List<Product> products;

  SelectedCategoryPage({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productBloc = BlocProvider.of<ProductsBloc>(context);
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<List<Product>>(
          stream: _productBloc.outProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(snapshot.data[index].name),
                  );
                },
              );
            } else
              return SizedBox();
          },
        ));
  }
}
