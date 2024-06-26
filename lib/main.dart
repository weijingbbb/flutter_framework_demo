import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
        // splitScreenMode: false, // 支持分屏尺寸
        // minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
        builder: (context, child) {
          return GetMaterialApp(
              title: 'Flutter 架构 Demo',
              // 隐藏右上角debug图标
              debugShowCheckedModeBanner: false,
              // 样式
              theme:
                  ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,
              // home: const Text('Flutter Demo Home Page'),
              // 路由
              initialRoute: RouteNames.systemSplash,
              getPages: RoutePages.list,
              navigatorObservers: [RoutePages.observer],
              // 多语言配置
              translations: Translation(), // 词典
              localizationsDelegates: Translation.localizationsDelegates, // 代理
              supportedLocales: Translation.supportedLocales, // 支持的语言种类
              locale: Translation.locale, // 默认，最初语言
              fallbackLocale: Translation.fallbackLocale, // 翻译不对时，使用的语言

              // builder
              builder: (context, widget) {
                widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

                // 不随系统字体缩放比例
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.noScaling),
                  child: widget,
                );
              });
        });
  }
}
