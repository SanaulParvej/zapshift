import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/app_controllers.dart';
import 'core/app_constants.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

class ZapShiftApp extends StatelessWidget {
  const ZapShiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ZapShiftTheme.light(),
            darkTheme: ZapShiftTheme.dark(),
            themeMode: appController.themeMode.value,
            initialBinding: AppBinding(),
            initialRoute: AppRoutes.splash,
            getPages: AppPages.pages,
            defaultTransition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 240),
          ),
        );
      },
    );
  }
}
