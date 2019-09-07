import 'package:ecommerce_flutter/api/db_api.dart';
import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/blocs/category_bloc.dart';
import 'package:ecommerce_flutter/blocs/products_bloc.dart';
import 'package:ecommerce_flutter/models/Category.dart';
import 'package:ecommerce_flutter/models/Product.dart';
import 'package:ecommerce_flutter/pages/selected_category_page.dart';
import 'package:ecommerce_flutter/widgets/containers/CartButton/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbAPI = new DbAPI();
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc _categoriesBloc =
        BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Commerce"),
          actions: <Widget>[CartButton()],
        ),
        body: StreamBuilder(
          stream: _categoriesBloc.outCategories,
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> categories) {
            if (categories.hasData) {
              return ListView.builder(
                itemCount: categories.data.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    onTap: () {
                      navigate(context, categories, index);
                    },
                    title: Text(
                      dbAPI.getCategories()[index].name,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  );
                },
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }

  navigate(BuildContext context, AsyncSnapshot<List<Category>> categories,
          int index) async =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
                bloc: ProductsBloc(categories.data[index]),
                child: SelectedCategoryPage(
                  products: [
                    Product.create("product"),
                    Product.create("product"),
                    Product.create("product"),
                    Product.create("product"),
                  ],
                ),
              )));
}
