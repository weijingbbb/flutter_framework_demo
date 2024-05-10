import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 这个表示先就行原生端（ios android）插件注册，然后再处理后续操作，这样能保证代码运行正确。
    // 使flutter和原生端的接口先初始化，后续那些需要依赖原生端的插件的代码就不会出现问题而报错。
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // 把所有的服务都初始化，注入到getx的内存里
    await Future.wait([
      // Storage().init(),
      // Get.putAsync<IMService>(() => IMService().init()),
    ]).whenComplete(() {
      Get.put<ConfigService>(ConfigService());
    });
  }
}
