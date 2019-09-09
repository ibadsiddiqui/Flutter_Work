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
    final _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Commerce"),
          actions: <Widget>[CartButton()],
        ),
        body: StreamBuilder<List<Category>>(
          stream: _categoriesBloc.outCategories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  final category = snapshot.data[index];
                  return ListTile(
                    onTap: () => navigate(context, category, index),
                    title: Text(
                      category.name.toString(),
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

  navigate(BuildContext context, Category category, int index) async =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider<ProductsBloc>(
                bloc: ProductsBloc(category),
                child: SelectedCategoryPage(),
              )));
}
