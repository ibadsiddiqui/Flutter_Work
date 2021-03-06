import 'package:ecommerce_flutter/blocprovs/bloc_provider.dart';
import 'package:ecommerce_flutter/blocs/cart_bloc.dart';
import 'package:ecommerce_flutter/blocs/category_bloc.dart';
import 'package:ecommerce_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BlocProvider<CartBloc>(
      child: MyApp(),
      bloc: CartBloc(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: CategoriesBloc(),
        child: HomePage(),
      ),
    );
  }
}
