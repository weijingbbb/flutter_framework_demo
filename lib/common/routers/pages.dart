import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];


  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.cartCartIndex,
      page: () => const CartIndexPage(),
    ),
    GetPage(
      name: RouteNames.goodsDetail,
      page: () => const DetailPage(),
    ),
    GetPage(
      name: RouteNames.goodsHome,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.myMyIndex,
      page: () => const MyIndexPage(),
    ),
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
  ];

  
}
