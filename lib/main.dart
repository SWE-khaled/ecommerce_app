import 'package:e_commerce/core/helpers/hive_helper.dart';
import 'package:e_commerce/core/helpers/network/network_helper.dart';
import 'package:e_commerce/home_test/cubit/cubit/home_cubit_test_cubit.dart';
import 'package:e_commerce/home_test/view/home_page_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:e_commerce/features/auth_test/cubit/cubit/auth_test_cubit.dart';
// import 'package:e_commerce/features/auth_test/view/auth_pageTe.dart';
// import 'package:e_commerce/features/posts/cubit/cubit/posts_cubit.dart';
// import 'package:e_commerce/features/posts/view/posts_page.dart';
// import 'package:e_commerce/features/splash/splash_page.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.tokenBox);
  NetworkHelper.intitalDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => PostsCubit()..fetchPosts(),
      //  create: (context) => AuthTestCubit(),
      create: (context) => HomeCubitTestCubit()..fetchBanners()..fetchProducts(),
       child: MaterialApp(debugShowCheckedModeBanner: false,
       home: HomePageTest()),
    );
  }
}
