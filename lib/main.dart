import 'package:dro_home_task/repository/cart_provider.dart';
import 'package:dro_home_task/theme.dart';
import 'package:dro_home_task/views/home/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DRO Home Task',
        theme: theme(),
        home: const HomeNavigationScreen(),
      ),
    );
  }
}